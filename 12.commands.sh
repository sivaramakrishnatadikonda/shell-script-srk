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

dnf list install nginx
dnf module list nodejs

if [ $? -ne 0 ]
then 
    echo "NGNIX is not installed ..... please installed"
   echo "NODEJS is not installed ..... please installed"
dnf install nginx -y
VALIDATE $? "NGINX"

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

dnf install mongodb-org -y 

VALIDATE $? "MONGODB"

if [ $? - eq 0 ]
then 
  echo "MONGODB installation is successfully"
else
   echo "MONGODB installatioon is failed"
   exit 1
fi

else 
  echo "MONGODB already installed nothing to do"

fi

dnf install nodejs -y

VALIDATE $? "NODEJS"

if [ $? -eq 0 ]
then
    echo "NODEJS installed sucessfully"
else 
    echo "NODEJS installation is failed"
    exit 1
fi

else 
    echo "NODEJS is already installed nothing to do"
fi