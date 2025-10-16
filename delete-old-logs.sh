#!/bin/bash

USERID=$(id -u)
R="/e[31m"
G="/e[32m"
Y="/e[33m"
N="/e[0m"

SOURCE_DIR="/home/ec2-user/app-log"

LOGS_FOLDER="/var/log/shell-script.logs"
FILE_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%M-%d-%H-%M-%S)

LOG_FILE_NAME="$LOG_FOLDER/$FILE_NAME-$TIMESTAMP.log"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 .... $R FAILURE $N"
        exit 1
    else
        echo -e "$2 .... $G success $N"
    fi    
}

if [ $USERID -ne 0 ]
then 
    echo "ERROR:: YOU MUST RUN THIS SCRIPT WITH ROOT USER"
    exit 1
fi   

echo "script started executing at $TIMESTAMP" &>>$LOG_FILE_NAME

FILES_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -mtime +14)

echo "files need to be deleted:: $FILES_TO_DELETE"

while read -r filepath
do
  echo "files to dlt $filepath"
  rm -rf $filepath
  echo "deleted files $filepath"
done << $FILES_TO_DELETE
