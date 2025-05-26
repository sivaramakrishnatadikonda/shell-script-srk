#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]
then
     echo -e " $R ERROR: code running with root access $N " 
     exit 1
else
    echo -e " $G you are running with root access $N " 
fi

VALIDATE(){
if [ $1 -eq 0 ]
then
     echo -e "Installing $2 is $G success $N " 
 else
      echo -e "Installing $2 is $R failed $N " 
      exit 1
fi 

}

dnf list installed nodejs

if [ $? -ne 0 ]
then 
   echo "Nodejs is not installed please installed" 
dnf install nodejs -y
VALIDATE $? "Nodejs"

else 
   echo -e " $Y Nodejs is already installed....don't do anything $N "
fi


