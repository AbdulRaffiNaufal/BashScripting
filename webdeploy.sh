#!/bin/bash

USER="abdul"

for host in `cat remote_host`
do
    scp multios_setup.sh $USER@$host:/tmp/
    sudo ssh $USER@$host sudo /tmp/multios_setup.sh
    sudo ssh $USER@$host sudo rm -rf /tmp/multios_setup.sh
    echo "Done"
done
