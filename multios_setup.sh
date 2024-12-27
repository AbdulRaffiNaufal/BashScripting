#!/bin/bash

# Variabel
##PKG="wget unzip httpd"
##SRVC="httpd"
TMP="/tmp/numpang"
URL="https://www.tooplate.com/zip-templates/2106_soft_landing.zip"
DIR="2106_soft_landing"


yum --help &> /dev/null

if [ $? -eq 0 ]
then
    # Set Variabel for Centos
    PKG="wget unzip httpd"
    SRVC="httpd"
    echo "RUNNING SETUP ON CENTOS"
    echo "Installing Dependencies"
    sudo yum install $PKG -y
    echo

    echo "Start and enable service"
    sudo systemctl start $SRVC
    sudo systemctl enable $SRVC
    echo

    echo "Creting tmp folder"
    mkdir -p $TMP
    cd $TMP
    echo

    echo "download template"
    wget $URL
    unzip $DIR.zip
    sudo cp -r $DIR/* /var/www/html
    echo

    echo "restart service"
    systemctl restart $SRVC
    echo

    echo "bersih file"
    rm -rf $TMP
    echo

else
    # Set Variabel for Ubuntu
    PKG="wget unzip apache2"
    SRVC="apache2"
    echo "RUNNING SETUP ON CENTOS"
    echo "Installing Dependencies"
    sudo apt update
    sudo apt install $PKG -y
    echo

    echo "Start and enable service"
    sudo systemctl start $SRVC
    sudo systemctl enable $SRVC
    echo

    echo "Creting tmp folder"
    mkdir -p $TMP
    cd $TMP
    echo

    echo "download template"
    wget $URL
    unzip $DIR.zip
    sudo cp -r $DIR/* /var/www/html
    echo

    echo "restart service"
    systemctl restart $SRVC
    echo

    echo "bersih file"
    rm -rf $TMP
    echo
fi
