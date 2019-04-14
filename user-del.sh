#!/bin/bash

# begin of user-list
echo ""   
echo -e "\e[0;36m---------- ALL USER LIST ----------\e[0;0m"
echo "USERNAME              EXP DATE     "
echo -e "\e[0;36m-----------------------------------\e[0;0m"

while read expired
do
	AKUN="$(echo $expired | cut -d: -f1)"
	ID="$(echo $expired | grep -v nobody | cut -d: -f3)"
	exp="$(chage -l $AKUN | grep "Account expires" | awk -F": " '{print $2}')"
	if [[ $ID -ge 1000 ]]; then
		printf "%-21s %2s\n" "$AKUN" "$exp"
	fi
done < /etc/passwd
echo -e "\e[0;36m-----------------------------------\e[0;0m"
echo ""
# end of user-list
# begin of user-expried
echo -e "\e[0;35m-----------------------\e[0;0m"
echo -e "\e[0;33mUser Expried list here!     "
echo -e "\e[0;35m-----------------------\e[0;0m"
cat /etc/shadow | cut -d: -f1,8 | sed /:$/d > /tmp/expirelist.txt
	totalaccounts=`cat /tmp/expirelist.txt | wc -l`
	for((i=1; i<=$totalaccounts; i++ )); do
		tuserval=`head -n $i /tmp/expirelist.txt | tail -n 1`
		username=`echo $tuserval | cut -f1 -d:`
		userexp=`echo $tuserval | cut -f2 -d:`
		userexpireinseconds=$(( $userexp * 86400 ))
		todaystime=`date +%s`
		if [ $userexpireinseconds -lt $todaystime ] ; then
			echo $username
		fi
	done
	rm /tmp/expirelist.txt
    
echo ""
# end of user-list
echo -e "\e[0;31mType username in user list for remove!\e[0;0m"
echo ""
read -p "What username do you want delete: " username

egrep "^$username" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
	echo ""
	read -p "Are you sure want delete username ($username) [y/n]: " -e -i y REMOVE
	if [[ "$REMOVE" = 'y' ]]; then
		passwd -l $username
		userdel $username
		echo ""
		echo -e "\e[0;33mUsername ($username) was removed success !\e[0;0m"
        echo ""
	else
		echo ""
		echo -e "\e[0;31mUsername ($username) was canceled remove!\e[0;0m"
	fi
else
	echo -e "\e[0;31mUsername ($username) not register in this server!\e[0;0m"
	exit 1
fi

cd ~/
