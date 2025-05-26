#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]
then
    echo -e " $R ERROR:: please code running the root user $N "
    exit 1
else
    echo "your are code running the root user"

fi 

VALIDATION(){
if [ $1 -eq 0 ]

then
    echo -e "Installation of $2 ------ $G Sucessfully $N "

else
    echo -e "Installation of $2 ------ $R Failed $N "
   exit 1
fi

}

dnf list install nginx
if [ $? -eq 0 ]
then 
    echo "nginx is not installed please install"
   dnf install nginx -y
   VALIDATION $? "nginx"

else
    echo -e " $Y nginx is already install do not do nothing  $N "  

fi


