#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
     echo "ERROR: code running with root acess"
     exit 1

else
     echo "your code running with root acess"

fi

VALIDATE(){

if [ $1 -eq 0 ]
then 
    echo  "Installed $2 is sucessfully"
else  
    echo "Installation $2 is failed"
    exit 1
fi

}

dnf install nginx -y

VALIDATE $? "NGINX"

if [ $? -eq 0 ]
then
   echo "NGINX installation ......SUCESSFULLY"

   else
       echo "NGINX already installed nothing to do"
       
   fi     

dnf install nodejs -y

VALIDATE $? "NODEJS"

if [ $? -eq 0 ]
then
    echo "NODEJS installed sucessfully"
else 
    echo "NODEJS already installed nothing to do"
    
fi

dnf install mongodb-org -y 

VALIDATE $? "MONGODB"

if [ $? -eq 0 ]
then
    echo "MONGODB installed sucessfully"
else
    echo "MONGODB is already installed nothing to do"
fi 