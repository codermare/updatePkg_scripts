#!/usr/bin/env bash

#set wifi interface to down


function macchange(){
 
  sudo macchanger -r -a wlo1 > /dev/null
  macchanger -s wlo1 | grep -i current
}

# check network interface state

function check_interface(){
    if [[ $(ip link show wlo1 | awk '{ print $9 }' == 'DOWN') ]];
       then
          echo 'setting up network interface up'
             sleep 3
          start_airmon
          $(sudo ip link set wlo1 down)

    else
       $(sudo macchanger -r -a wlo1)

}

function start_airmon(){ 

      $(sudo airmon-ng check)
      $(sudo airmon-ng check kill)
      echo "setting on monitor mode"
      sleep 2

      # check if monitor mode is already set or not

      if [ $(iw wlo1 info | grep -i type | awk '{ print $2 }') != 'monitor'];
         then
           $(sudo airmon-ng check kill)
           echo "setting monitor mode on interface"
           $(sudo airmon-ng start wlo1)
      # checking error code of airmon start commands

      if [ $? -eq 0 ];
        then
          echo "monitor mode set successfully on interface wlo1"
          if [ $(ip addr show wlo1 | awk '{ print $9 }') == 'DOWN' ];
             then
               check_interface
      else 
         # check network interface devices
         # calling check interface device state

         check_interface
      fi
}


if [ "$(whoami)" != "root" ]; then
  echo "This scripts require priviledge permission to run"
else
  # check if device interface is up and running 
  if [ "$(ip link show wlo1 | awk '{ print $9 }')" == "DOWN" ]; then
    echo "setting up network interface......."
    sleep 3
    sudo ip link set wlo1 up
    echo "interface is set successfully"
 else
    $(sudo ip link set wlo1 down)
  fi
  macchange
fi
