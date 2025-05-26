#!/bin/bash
echo "Checking security group $1"
if [ -z "$1" ]; then
    echo "ERROR: Invalid security group name provided: $1"
    exit 1
fi

securitygrp=$1
res=$(aws ec2 describe-security-groups --profile=iam-profile --filters Name=ip-permission.from-port,Values=22 Name=ip-permission.from-port,Values=443 Name=ip-permission.from-port,Values=80 Name=ip-permission.from-port,Values=8080 --query 'SecurityGroups[*].{Name:GroupName,ID:GroupId}' | grep $securitygrp | head -1)

if [ -z "$res" ]; then
    exit 1
else
    echo $(echo $res | cut -f 1 -d ' ')
    exit 0
fi

