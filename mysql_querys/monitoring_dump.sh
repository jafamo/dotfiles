#!/bin/bash
#only show progressbar
mysqldump -hxxx -uxxx -p dbname | pv -W > dump.sql


