#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then 
     echo "ERROR: code running with root acess"
     exit 1

else
     echo "your code running with root acess"

fi

dnf list install nginx

if [ $? -ne 0 ]
then 
    echo "NGNIX is not installed ..... please installed"

else
    echo "NGINX is installed ....... successfully"

fi