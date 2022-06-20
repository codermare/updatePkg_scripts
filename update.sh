#!/usr/bin/env bash

updatePackages(){

if [[ "$(whoami)" != "root" ]]; then
    haja="phillipsiah"
    pyfiglet $haja
    echo "This script must be run as root"
    exit 0;
else
     while true;
         do 
            echo "Updating packages...."
            sleep 1
            sudo apt update -y &> /dev/null
            errorcode=$?
            if [[ errorcode -ne 0 ]]; then
                echo "fail to update packages...";
                clear && echo "Retrying again please wait...."
                sleep 1
                sudo apt --fix-missing update -y &> /dev/null
                errcode=$?
                if [[ errcode -eq 0 ]]; then
                    echo "Packages are fixed and updated successfully"
                    break;
                else
                    echo "checking internet connection Please wait....."
                    sleep 1
                    continue 
                fi
                clear
            else
                echo "All repo updated successfully";
                break;
            fi;
        done;
    fi;
}

# calling update function
updatePackages


# installPackage(){
#     packname=$1
#     if [[ -z $packname ]];
#      then
#         echo "Please provide a package name"
#     else
#         echo "Installing $packname "
#         printf "please wait"
#         sudo apt install "$packname"
#         if [[ errcode -ne 0 ]]; then
#             sudo apt --fix-broken install -y 
#             #continue;
#         else
#             echo ""
#         fi
#     fi
# }
