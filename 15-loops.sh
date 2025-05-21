#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
PACKAGES=("mysql" "nginx" "python")

mkdir -p $LOGS_FOLDER
echo "Script started executing at : $(date)" | tee -a $LOG_FILE

if [ $USERID -ne 0 ]
then
     echo -e " $R ERROR: code running with root access $N " | tee -a $LOG_FILE
     exit 1
else
    echo -e " $G you are running with root access $N " | tee -a $LOG_FILE
fi

VALIDATE(){
if [ $1 -eq 0 ]
then
     echo -e "Installing $2 is $G success $N " | tee -a $LOG_FILE
 else
      echo -e "Installing $2 is $R failed $N " | tee -a $LOG_FILE
      exit 1
fi 

}
for package in $@
do
   dnf list installed $package &>>LOG_FILE 
   if [ $? -ne 0 ]
then 
   echo "$package is not installed please installed" | tee -a $LOG_FILE
dnf install $package -y&>>$LOG_FILE
VALIDATE $? "$package"

else 
   echo -e " $Y $package is already installed....don't do anything $N " | tee -a $LOG_FILE
fi
done

