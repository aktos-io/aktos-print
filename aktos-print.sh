#!/bin/bash

FILE=$1
counter=0
red='\033[0;31m'
blue='\033[0;34m'
green='\033[1;32m'
yellow='\033[1;33m'
nc='\033[0m'

echo -e " ${blue}YOUR PRINTERS:${nc}"
echo "----------------------------------------------------------"

IFS=$'\n'
array=($(lpstat -a | awk '{print $1}'))


lpstat -a | awk '{print $1}' | while read line; do 
counter=$((counter+1));
echo -e "${red}[$counter]${nc} $line";
done

echo "----------------------------------------------------------"
echo -e "${red}PLEASE SELECT PRINTER${nc}"
read choose
#echo "lpr $FILE -P ${array[$choose-1]}"

#lpr $FILE -P ${array[$choose-1]}
lpr $FILE -P ${array[$choose-1]} -o MediaType=ExtraHeavy -o Density=Density5

