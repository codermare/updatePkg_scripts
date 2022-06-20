#!/usr/bin/env bash

checkInterfaceDevices(){
    
    local devices=$(

            ip link show | 
            grep -i "wlo1" |
            awk '{ print $2 }')
       echo $devices
}

checkInterfaceDevices


