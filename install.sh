#!/bin/bash

echo "instalando..."

sudo apt-get install figlet curl nmap grep t50 php pip python python2 python3 aircrack-ng hydra perl -y

pip install pynput

chmod +x Ghost007.sh
cd requisitos/
chmod +x *
chmod +x creat-backdoor/install.sh
bash creat-backdoor/install.sh
cd ..

echo "Instalação das requisições completa"
echo "para executar digite: ./Ghost007.sh"
