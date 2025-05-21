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

dnf install nginx -y

if [ $? -eq 0 ]
then
   echo "NGINX installation ......SUCESSFULLY"

   else
       echo "NGINX installation .... FAILED"
       exit 1
   fi     


else
    echo "NGINX is already  installed ....... nothing to do"

fi