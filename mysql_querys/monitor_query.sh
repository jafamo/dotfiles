#!/bin/bash
#Show the query in live 

watch 'echo "show processlist;" |  /opt/lampp/bin/mysql  -uroot -ppassword';
