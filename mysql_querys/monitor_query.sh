#!/bin/bash

watch 'echo "show processlist;" |  /opt/lampp/bin/mysql  -uroot -ppassword';
