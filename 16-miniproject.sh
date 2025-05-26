#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: please code running the root user"
    exit 1
else
    echo "your are code running the root user"

fi 

dnf install mysql -y
if [ $? -eq 0 ]

then
    echo "Installation of mysql ------Sucessfully"

else
    echo "Installation of mysql ------Failed"
    exit 1
fi
