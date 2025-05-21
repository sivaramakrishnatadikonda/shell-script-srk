#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then 
     echo "ERROR: code running with root acess"
     
else
     echo "your code running with root acess"

fi