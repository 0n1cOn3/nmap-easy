#! /bin/zsh
###################
# nmap easycli    #
# Version: 0.1    #
# Author: 0n1cOn3 #
#@@@@@@@@@@@@@@@@@#
#

# Ctrl+C Sigkill Trap
esc_count=0

root () {
    # Check Root access
echo ''
sleep 1
if [ "$EUID" -ne 0 ] 
    then
    echo -e "${RED} [✗] No root detected :("
    echo ""
    echo -e "${RED} [!] Start the script with 'sudo ./nmap-cli.sh'."
    echo ""
    echo -e "${YELLOW} [!] Exiting Script..."
    sleep 3
    exit
else
    init
exit
fi
}

function no_ctrlc () {
let esc_count++
echo
if [[ $esc_count == 1 ]]; then
echo "Stop that."
elif [[ $esc_count == 2 ]]; then
echo "Once more and I quit."
else
echo "That's it.  I quit."
exit
fi
}


while no_ctrlc do

#color support
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
MAGENTA="\e[35m"
CYAN="\e[36m"
BOLD="\e[1m"

banner () {
    echo -e " ${YELLOW}
<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<                                                                         
| Made in 2020                                               ████   ███  |
|                                                           ░███  ░░░    |
|  ████████   █████████████    ██████   ████████      ██████ ░███  ████  |
| ░███░░███ ░░███░░███░░███  ░░░░░███ ░░███░░███    ███░░███ ░███  ░███  |
| ░███ ░███  ░███ ░███ ░███   ███████  ░███ ░███   ░███ ░░░  ░███  ░███  |
| ░███ ░███  ░███ ░███ ░███  ███░░███  ░███ ░███   ░███  ███ ░███  ░███  |
| ████ █████ █████░███ █████░░████████ ░███████    ░░██████  █████ █████ |
| ░░░░ ░░░░░ ░░░░░ ░░░ ░░░░░  ░░░░░░░░  ░███░░░      ░░░░░░  ░░░░░ ░░░░░ |
|                                       ░███                             |
|                                       █████                            |
| Version: 0.1                          ░░░░░         Made by: 0n1cOn3   |
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    "
}

menu () {
selection=
until [ "$selection" = "0" ]; do
echo -e " ${GREEN}

Press 1 == Port Scan
Press 2 == Vuln Scan
Press 3 == Stealth Scan 

Press 9 == Update nmap-cli
Press 0 == Exit program
"
     echo -n "Enter Selection: "
     read -r selection
     echo -e "${GREEN}<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
case $selection in
1 )
clear
banner
echo -e "${GREEN}[!] Enter you target IP to scan:" 
read -r "IP"
sudo nmap "$IP"
banner;;
    2 )
    clear
    banner
    echo "${YELLOW}[!] Vulnerability Mode Selected "
    echo -e "${GREEN}[!] Enter you target Host to scan:" 
    read -r "Host"
    nmap -sV --script=vulscan/vulscan.nse $Host
    banner;;
        3 ) 
        clear
        banner
        echo "${YELLOW}[!]Stealh Mode Selected"
        echo ""
        echo -e "${GREEN}[!] Enter you target IP to scan:" 
        read -r "IP"
        sudo nmap "$IP"
        banner;;
         	4 )
            exit;;
				5 ) 
                exit;;	
					6 ) 				
                    exit;;
				   		7 ) 				
                        exit;;
							8 ) 
						    exit;;
				0 ) exit;;
         * ) echo "Please enter 1,2,3,4,9 or 0 for exit"
     esac
done
}

tmp () {
    if [[ 1 || 2 || 3 || 4 || 5 ]];then
    rm 1 2 3 4 5
    fi
}
init () {
# Check Root access
echo ''
sleep 1
if [ "$EUID" -ne 0 ]
then
echo -e "${RED} [✗] No root detected :("
echo ""
echo -e "${RED} [!] Start the script with sudo / root."
echo ""
echo -e "${YELLOW} [!] Exiting Script..."
sleep 3
exit
else
echo -e "${GREEN} [✓] Root Access :)"
sleep 2
echo ""
echo -e "${GREEN} [!] Check dependecies :)"
echo ""
sleep 1
if ! hash nmap 2>/dev/null;then
    echo ""
	echo -e $RED "[✗] Package nmap not installed"
    echo ""
	apt-get install nmap -y || 2&>/var/logs/nmapclierror.log
else
    echo ""
	echo -e $GREEN "[✓] Package nmap installed" | tee -a 1
fi	
sleep 0.2
if ! hash lolcat 2>/dev/null;then
    echo ""
    echo -e $GREEN "[✓] Package lolcat installed" | tee -a 2
else
    echo ""
    echo -e $RED "[✗] Package lolcat not installed" 
    echo ""
    apt-get install lolcat -y || 2&>/var/logs/nmapcli-error.log
fi	
sleep 0.2
if ! hash figlet 2>/dev/null;then
	echo ""
    echo -e $RED "[✗] Package figlet not installed"
    echo ""
	apt-get install figlet -y || 2&>/var/logs/nmapcli-error.log
else
    echo ""
	echo -e $GREEN "[✓] Package figlet installed" | tee -a 3
fi
sleep 0.2
if ! hash git 2>/dev/null;then
    echo ""
    echo -e $RED "[✗] Package git not installed" 
    echo ""
    apt-get install git -y || 2&>/var/logs/nmapcli-error.log
else
    echo ""
    echo -e $GREEN "[✓] Package git installed" | tee -a 4
fi	
if ! hash figlet 2>/dev/null;then
	echo ""
    echo -e $RED "[✗] Package vulscan not installed"
	git clone https://github.com/scipag/vulscan scipag_vulscan 2&> /var/logs/nmapclierror.log
    ln -s `pwd`/scipag_vulscan /usr/share/nmap/scripts/vulscan 2&> /var/logs/nmapclierror.log
else
    echo ""
	echo -e $GREEN "[✓] Package vulnscan installed" | tee -a 5
fi
fi
paste 1 2 3 4 5 > nmapcli-installed
sleep 2
tmp
echo ""
echo "loading menu...please wait"
sleep 3
clear
banner
menu
}

# Update Modul - Thank you #Rebl0x3r for the snippet!!
update () {
	up=$(git pull &>/dev/null)
	echo -e "${MAGENTA}[*] ${BLUE}Checking if you up-to-date..."
	echo ""
	sleep 0.5
	if [[ "$up" == "Already up to date." ]]
	then
		echo -e "${GREEN}[i] ${BLUE}Already on the latest version :-)"
	else
		git pull -q &>/dev/null
		echo -e "${MAGENTA}[*] ${BLUE}Tool is updated to version $version."
	fi
}


loader () {
    if [[ -s nmapcli-installed ]];then
    clear
    banner
    root
    menu
    else
    banner
    init
fi
}

clear
loader
clear
banner
menu
