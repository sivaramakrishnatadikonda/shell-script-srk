#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: please code running the root user"
    exit 1
else
    echo "your are code running the root user"

fi 