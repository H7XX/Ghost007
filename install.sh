#!/bin/bash

clear

echo "instalando. . ."

sudo apt-get install figlet curl nmap grep t50 php pip python python2 python3 aircrack-ng dirb metasploit-framework -y

pip install pynput

chmod +x requisitos/scanport.sh
chmod +x requisitos/ipinfo.sh
chmod +x requisitos/DosConfig.sh
chmod +x requisitos/slowconfig.sh
chmod +x requisitos/t50config.sh
chmod +x requisitos/SpamBot.py
chmod +x requisitos/WifiDos.sh
chmod +x requisitps/wifibrute.sh
chmod +x Ghost007.sh

clear

figlet Download Complete.
