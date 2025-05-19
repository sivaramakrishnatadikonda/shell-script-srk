#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
     echo "ERROR: code running with root access"
     exit 1
else
    echo "you are running with root access"
fi

VALIDATE(){
if [ $1 -eq 0 ]
then
     echo "Installing $2 is success"
 else
      echo "Installing $2 is failed"
      exit 1
fi 

}

dnf list installed nginx

if [ $? -ne 0 ]
then 
   echo "Nginx is not installed please installed"
dnf install nginx -y
VALIDATE $? "NGINX"

else 
   echo "NGINX is already installed....don't do anything"
fi


 dnf list installed mysql
if [ $? -ne 0 ]
then 
   echo "MYSQL is not installed please installed"

    dnf install mysql -y

    VALIDATE $? "MYSQL"

else
       echo "MYSQL is already installed.nothing do"
 fi

dnf installed python3
if [ $? -ne 0 ]
then
   echo "please installed python"
dnf install python3 -y
VALIDATE $? "PYTHON3"

else
     echo "PYTHON3 is already installed ...nothiong do"
     fi    