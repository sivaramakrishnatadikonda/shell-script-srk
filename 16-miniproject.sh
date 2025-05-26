#!/bin/bash

USERID=$(id -u)
R=\e[31m
G=\e[32m
Y=\e[33m
N=\e[0m

if [ $USERID -ne 0 ]
then
    echo "$R ERROR:: please code running the root user $N"
    exit 1
else
    echo "your are code running the root user"

fi 

dnf install mysql -y
if [ $? -eq 0 ]

then
    echo "Installation of mysql ------$G Sucessfully $N"

else
    echo "Installation of mysql ------ $R Failed $N"
    exit 1
fi
