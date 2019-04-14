#!/bin/bash

echo ""
echo -e "\e[0;34m-----QUICK CREATE NEW USER/PASSWORD -----\e[0;0m"
echo ""   
read -p "How many accounts to be created: " JUMLAH
echo ""
read -p "How many days of active account: " AKTIF

today="$(date +"%Y-%m-%d")"
expire=$(date -d "$AKTIF days" +"%Y-%m-%d")

echo ""
echo -e "\e[0;32m--------------------------\e[0;0m"
echo -e "\e[0;35mYour user success created \e[0;0m"
echo -e "\e[0;32m--------------------------\e[0;0m"

echo ""
for (( i=1; i <= $JUMLAH; i++ ))
do
	USER=`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 4 | head -n 1`;
	useradd -M -N -s /bin/false -e $expire $USER
	#PASS=`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 4| head -n 1`;
	echo $USER:$USER | chpasswd
	
	echo "$i. Username/Password: $USER"
done
echo ""
echo ""
echo ""
echo -e "\e[0;36m--------------------------\e[0;0m" 
echo "Expried day: $(date -d "$AKTIF days" +"%d-%m-%Y")"
echo -e "\e[0;36m--------------------------\e[0;0m"
echo ""
cd ~/
