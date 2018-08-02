#!/bin/sh

#----------------------------------------------------------
# a simple mysql database backup script.
# version 2, updated July 10, 2018.
# copyright 2018 Javier Farinos, http://jafamo.org
#----------------------------------------------------------
# This work is licensed under a Creative Commons 
# Attribution-ShareAlike 3.0 Unported License;
# see http://creativecommons.org/licenses/by-sa/3.0/ 
# for more information.
#----------------------------------------------------------

# (1) set up all the mysqldump variables
FOLDER=/mnt/linux/backup/databases/
FILE=${FOLDER}$1.sql.`date +"%Y%m%d"`
DBSERVER=127.0.0.1
DATABASE=$1
LOG=$DATABASE.log
USER=$2
PASS=$3

if [ ! -d "$FOLDER$DATABASE" ]; then
    mkdir $FOLDER$DATABASE;
fi

FILE=$FOLDER$DATABASE/$1.sql.`date +"%Y%m%d"`

# (2) in case you run this more than once a day, remove the previous version of the file
unalias rm     2> /dev/null
rm ${FILE}     2> /dev/null
rm ${FILE}.gz  2> /dev/null

# (3) do the mysql database backup (dump)

# use this command for a database server on a separate host:
#mysqldump --opt --protocol=TCP --user=${USER} --password=${PASS} --host=${DBSERVER} ${DATABASE} > ${FILE}

# use this command for a database server on localhost. add other options if need be.
mysqldump --opt --user=${USER} --password=${PASS} --single-transaction  ${DATABASE} > ${FILE}

# (4) gzip the mysql database dump file
gzip $FILE

# (5) show the user the result
echo "${FILE}.gz was created:"
ls -l ${FILE}.gz

# (6) delete old backups and logs deleted
find $FOLDER$DATABASE/  -type f -mtime +30 -name "*.gz"  -print  -delete >> $FOLDER$DATABASE/$LOG

