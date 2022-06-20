#!/usr/bin/env bash

function updateSystem(){

    sudo apt update -y
 # check if update succeed
    if [ $(echo $?) -eq 0 ]; then
        echo " All repo update successfully"
        sudo apt upgrade -y
        echo "All packages upgraded successfully"
    else 
        echo "fixing missing upgrade...."
        sudo apt --fix-missing upgrade -y
        echo "done"
    fi
   

    # upgrade system full

    if [ $? -eq 0 ]; then
       sudo apt full-upgrade -y
       sudo apt dist-upgrade -y 
       echo "system upgraded successfully"
    else 
       echo "Error occured when upgrading system packages"
       echo "fixing broken packages"
       sudo apt --fix-broken upgrade -y
       echo "Done fixing packages"
    fi
 
} # EOF the update function 
# calling system update function
updateSystem
