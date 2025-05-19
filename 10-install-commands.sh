#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
     echo "ERROR: code running with root access"
     exit 1
else
    echo "you are running with root access"
fi

 dnf install mysql -y

if [ $? -eq 0 ]
then
    echo "Inatalling the MYSQL ....SUCCESSFULLY"
    #exit 0

else 
     echo "Installing MYSQL ..... FAILED"
    exit 1
fi