#!/bin/bash

clear

echo "instalando. . ."

sudo apt-get install figlet curl nmap grep t50 php pip python python2 python3 aircrack-ng metasploit-framerork -y

pip install pynput
pip install slowloris

chmod +x requisitos/atualizar.sh
chmod +x requisitos/ipinfo.sh
chmod +x requisitos/DosConfig.sh
chmod +x requisitos/slowconfig.sh
chmod +x requisitos/t50config.sh
chmod +x requisitos/SpamBot.py
chmod +x requisitos/WifiDos.sh
chmod +x Ghost007.sh

clear

figlet Download Complete.
