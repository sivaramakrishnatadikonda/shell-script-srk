#!/bin/bash

echo "All the variable pass the script: $@"
echo " script name: $0"
echo "pwd : $PWD"
echo "user name : $USER"
echo "number of varaibles pass the script: $#"
echo "home directory: $HOME"
echo "pid: $$"
sleep 10 &
echo "backgroud pid: $!"
echo "exit status code: $?"
