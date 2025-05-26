#?/bin/bash

USERID=$(id -u)
LOG_FOLDER="/var/log/miniporject-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"
PACKAGE=( "mysql" "nodejs" "python3" )

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

mkdir -p $LOG_FOLDER


if [ $USERID -ne 0 ]
then 
  echo " $R ERROR :: $N  please run the script in root access"
  exit 1
else 
  echo "your are run the script in root access"
fi

VALIDATE(){

if [ $1 -eq 0 ]
then 
 echo "INSTALLING $2 IS  ------ $G SUCESSFULLY $N" | tee -a $LOG_FILE
else 
    echo "INSTALLING $2 IS  ----- $R FAILED $N " | tee -a $LOG_FILE
    exit 1
fi 
}

for packages in $@ 
do 
dnf module list $packages &>> LOG_FILE

if [ $? -eq 0 ]
then 
  echo " $packages IS NOT INSTALLED PLEASE INSTALLED" | tee -a $LOG_FILE
dnf install $packages -y
VALIDATE $? "$packages"
else 
   echo " $packages IS ALREADY INSTALLED NOTHING TO DO" | tee -a $LOG_FILE
fi 
done
