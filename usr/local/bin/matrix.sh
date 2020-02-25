#!/bin/bash
if [ "$1" == "-d" ]; then 
	use_dollar=1
else
	use_dollar=0
fi


LINES=`tput lines`
COLUMNS=`tput cols`
echo -e "\e[1;40m"
clear 
while : 
do 
R72=$((RANDOM%72))
RC=$((RANDOM%COLUMNS))
echo $LINES $COLUMNS ${RC} ${R72}
sleep 0.05
done | gawk '{ 
if('$use_dollar'==0)
	letters="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789@#$%&*()"; 
else
	letters="$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"; 

c=$4; 
letter=substr(letters,c,1);
a[$3]=0;
for (x in a) 
{
	o=a[x];a[x]=a[x]+1; 
	printf "\033[%s;%sH\033[2;32m%s",o,x,letter; 
	printf "\033[%s;%sH\033[1;37m%s\033[0;0H",a[x],x,letter;
	if (a[x] >= $1) 
	{ 
		a[x]=0; 
	} 
}
}'
