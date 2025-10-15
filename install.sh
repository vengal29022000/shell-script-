ID=$(id -u)

if [ $ID -ne 0 ]
then
    echo "please run this script with root user"
else 
    echo "you are a root user"
fi

dnf install mysql -y 

if [ $? -ne 0 ]
then 
    echo "installation of mysql got failed"
else
    echo "installation of mysql got success"
fi
    