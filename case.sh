#!/bin/bash

#Case
		
choice="Y"
while [ $choice = "Y" ]
do
	echo " 
	1) Authentication log
   	2) System log
  	3) Dmesg
   	4) Boot log
   	5) Exit"

	read log

	case "$log" in
		1) echo "Authentication log"
			tail /var/log/auth.log
			exit
  			;;
		2) echo "System log"
   			tail /var/log/syslog
   			exit
  			;;
		3) echo "Dmesg"
  			tail /var/log/dmesg
  			exit
  			;;
		4) echo "Boot log"
   			tail /var/log/boot.log
   			exit
  			;;
		5) echo "Exit"
  			exit
  			;;
		*) echo "Error. You have to choose from 1 to 5. Do you want to try again or exit (Y/N) : "
			read choice
			;;
	esac
done
