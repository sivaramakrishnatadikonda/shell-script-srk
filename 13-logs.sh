#!/bin/bash

USERID=$(id -u)
R=\e[31m
G=\e[32m
Y=\e[33m
N=\e[33m

LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "Script started executing at : $(date)" | tee -a $LOG_FILE

if [ $USERID -ne 0 ]
then
     echo  -e "$R ERROR: code running with root access $N" | tee -a $LOG_FILE
     exit 1
else
    echo  -e "$G you are running with root access $N"| tee -a $LOG_FILE
fi

VALIDATE(){
if [ $1 -eq 0 ]
then
     echo -e "Installing $2 is $G success $N" | tee -a $LOG_FILE
 else
      echo  -e "Installing $2 is $R failed $N" | tee -a $LOG_FILE
      exit 1
fi 

}

dnf list installed nginx&>>$LOG_FILE

if [ $? -ne 0 ]
then 
   echo "Nginx is not installed please installed" | tee -a $LOG_FILE
dnf install nginx -y&>>$LOG_FILE
VALIDATE $? "NGINX"

else 
   echo " $Y NGINX is already installed....don't do anything $N" | tee -a $LOG_FILE
fi


 dnf list installed mysql&>>$LOG_FILE
if [ $? -ne 0 ]
then 
   echo "MYSQL is not installed please installed" | tee -a $LOG_FILE

    dnf install mysql -y&>>$LOG_FILE

    VALIDATE $? "MYSQL"

else
       echo " $Y MYSQL is already installed.nothing do $N" | tee -a $LOG_FILE
 fi

dnf installed python3&>>$LOG_FILE
if [ $? -ne 0 ]
then
   echo "please installed python" | tee -a $LOG_FILE
dnf install python3 -y&>>$LOG_FILE
VALIDATE $? "PYTHON3"

else
     echo " $Y PYTHON3 is already installed ...nothiong do $N" | tee -a $LOG_FILE
     fi    
