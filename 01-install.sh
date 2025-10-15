#!/bin/bash

ID=(id -u)

if [ $ID -ne 0 ]
then
    echo "please run the script with the user"
    exit 1
else 
    echo "you are a root user"
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    dnf install mysql -y
    if [ $? -ne 0 ]
    then 
        echo "installation of mysql got failed"
        exit 1
    else 
        echo "installation of mysql got success"
    fi
else
    echo "mysql got installed already"
fi            