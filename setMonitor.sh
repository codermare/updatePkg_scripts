#!/usr/bin/env bash

function setMonitorMode(){
     
     inface=$1
     echo $inface
     # check if interface exit
     
     wliface=$(iw dev | grep -i $inface | awk '{ print $2 }')
     echo "checking $inface if exist ..."

     sleep 2

     if [[ $(echo $wliface) == $(echo $inface) ]]; then
           netcontroller=$(
              lspci -k | 
              grep -i "network controller" | 
              awk '{ print $4, $5, $6, $7 }')
              echo "Found Device : $netcontroller"
     fi 

     # call check interface here

#     $(sudo stemctl stop NetworkManager)
#     $(sudo pkill NetworkManager)
#     $(sudo airmon-ng check)
#     $(sudo airmon-ng check kill)
#     $(sudo ip link set $inface down)
#    $(iw $inface set monitor control)
     
#     if [ echo $# -eq 0 ]; then
        # call macchanger function here
#        if [ $(macchanger -r -a $inface) -eq 0 ]; then
#           echo "monitor mode set successfully"
#           echo "$inface'mon'" 
#        fi
#     fi

}
setMonitorMode $1
