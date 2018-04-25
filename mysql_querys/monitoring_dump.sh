#!/bin/bash

mysqldump -hxxx -uxxx -p dbname | pv -W > dump.sql


