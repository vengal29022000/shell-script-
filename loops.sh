#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


VALIDATE() {
if [ $1 -ne 0 ]
    then
        echo "$2 ... FAILURE"
        exit 1
    else
        echo "$2 ... SUCCESS"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "ERROR:: You must have sudo access to execute this script"
    exit 1 #other than 0
fi

for package in $@
do
    dnf list installed $package

    if [ $? -ne 0 ]
    then # not installed
        dnf install $package -y
        VALIDATE $? "INSTALLING $pacakge"
    else
        echo "$package is already ... INSTALLED"
    fi
done    

