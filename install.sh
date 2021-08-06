#!/bin/bash

clear

echo "instalando. . ."

sudo apt-get install figlet curl nmap grep t50 php pip python python2 python3 aircrack-ng dirb metasploit-framework -y

pip install pynput

chmod +x Ghost007.sh

cd requisitos/

chmod +x *

cd creat-backdoor/

chmod +x back7.sh

clear

figlet Download Complete.
