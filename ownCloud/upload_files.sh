#!/bin/bash
# When copy any file from terminal to data dir, you need update database
#
# Go to Owncloud Directory and find 
#

find / -name "occ" 2>/dev/null
sudo -u www-data php occ files:scan --all
