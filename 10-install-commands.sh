#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
     echo "ERROR: code running with root access"
     exit 1
else
    echo "you are running with root access"
fi


dnf list installed nginx

if [ $? -ne 0]

then 

    echo "Nginx is not installed please installed"


     dnf install nginx -y

if [ $? -eq 0 ]
then
    echo "Inatalling the NGINX ....SUCCESSFULLY"
    #exit 0

else 
     echo "Installing NGINX ..... FAILED"
    exit 1
fi
else 
   echo "NGINX is already installed....don't do anything"
   exit 1

fi
