#!/bin/bash -ex
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
echo BEGIN
echo "JC, User_Data Was here"
date '+%Y-%m-%d %H:%M:%S'
echo END