#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/miniproject-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME .log"
PACKAGES=("mysql" "nodejs" "nginx" )
mkdir -p $LOGS_FOLDER  
echo "Script started executing at : $(date)" | tee -a $LOG_FILE
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

for package in $@
do 
dnf list installed nodejs
if [ $? -eq 0 ]
echo " $package is not installed please installed" | tee -a $LOG_FILE
dnf install nodejs -y&>>LOG_FILE
VALIDATE $? "$package"
 else 
   echo -e " $Y $package is already installed....don't do anything $N " | tee -a $LOG_FILE
fi
done


