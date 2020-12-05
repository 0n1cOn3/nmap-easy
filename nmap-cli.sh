#!/bin/env bash
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#
# nmap easycli                               #
# Version: 0.1                               #
# Author: 0n1cOn3                            #
# Contributer: MrBlackX/TheMasterCH/Rebl0x3r #
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#
#
version=0.2
# Ctrl+C Sigkill Trap
esc_count=0

root(){
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
echo "Exiting easy-nmap..."
elif [[ $esc_count == 2 ]]; then
echo "Made in Switzerland, 2020"
else
echo "Bye"
exit
fi
}

#color support
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
MAGENTA="\e[35m"
CYAN="\e[36m"
BOLD="\e[1m"

banner(){
    echo -e " ${YELLOW}
****************************************************************************
****************************************************************************                                                                        
** Made in 2020                                               ████   ███  **
**                                                            ░███  ░░░   **
**  ████████   █████████████    ██████   ████████      ██████ ░███  ████  **
** ░███░░███ ░░███░░███░░███  ░░░░░███ ░░███░░███    ███░░███ ░███  ░███  **
** ░███ ░███  ░███ ░███ ░███   ███████  ░███ ░███   ░███ ░░░  ░███  ░███  **
** ░███ ░███  ░███ ░███ ░███  ███░░███  ░███ ░███   ░███  ███ ░███  ░███  **
** ████ █████ █████░███ █████░░████████ ░███████    ░░██████  █████ █████ **
** ░░░░ ░░░░░ ░░░░░ ░░░ ░░░░░  ░░░░░░░░  ░███░░░      ░░░░░░  ░░░░░ ░░░░░ **
**                                       ░███                             **
**                                       █████                            **
** Version: 0.2                          ░░░░░         Made by: 0n1cOn3   **
****************************************************************************
****************************************************************************"
}
# Update Modul - Thank you #Rebl0x3r for the snippet!!
update(){
	up=$(git pull &>/dev/null)
	echo -e "${MAGENTA}[*] ${BLUE}Checking if you up-to-date..."
	echo ""
	sleep 0.5
	if [[ "$up" == "Already up to date." ]]
	then
	git pull -q &>/dev/null
	echo -e "${MAGENTA}[*] ${BLUE}Tool has been updated to version $version."
	else
    echo -e "${GREEN}[i] ${BLUE}Already on the latest version :-)"
	fi
    sleep 3
    clear
    banner
}

menu(){
    selection=
    until [ "$selection" = "0" ]; do
        echo -e "
${MAGENTA}_____________________________________________________________________________

 ${BLUE} [1] ${GREEN} Port Scan        ${BLUE} [37] ${GREEN} Coming Soon...      ${BLUE} [73] ${GREEN} Coming Soon...
 ${BLUE} [2] ${GREEN} Vuln Scan        ${BLUE} [38] ${GREEN} Coming Soon...      ${BLUE} [74] ${GREEN} Coming Soon...
 ${BLUE} [3] ${GREEN} Stealth Scan     ${BLUE} [39] ${GREEN} Coming Soon...      ${BLUE} [75] ${GREEN} Coming Soon...       
 ${BLUE} [4] ${GREEN} SynPort Scan     ${BLUE} [40] ${GREEN} Coming Soon...      ${BLUE} [76] ${GREEN} Coming Soon...           
 ${BLUE} [5] ${GREEN} TCPPort Scan     ${BLUE} [41] ${GREEN} Coming Soon...      ${BLUE} [77] ${GREEN} Coming Soon...           
 ${BLUE} [6] ${GREEN} UDPPort Scan     ${BLUE} [42] ${GREEN} Coming Soon...      ${BLUE} [78] ${GREEN} Coming Soon...
 ${BLUE} [7] ${GREEN} TCPWinPort Scan  ${BLUE} [43] ${GREEN} Coming Soon...      ${BLUE} [79] ${GREEN} Coming Soon...
 ${BLUE} [8] ${GREEN} TCPMaiPort Scan  ${BLUE} [44] ${GREEN} Coming Soon...      ${BLUE} [80] ${GREEN} Coming Soon...           
 ${BLUE} [9] ${GREEN} Coming Soon      ${BLUE} [45] ${GREEN} Coming Soon...      ${BLUE} [81] ${GREEN} Coming Soon...
 ${BLUE} [10] ${GREEN}Coming Soon      ${BLUE} [46] ${GREEN} Coming Soon...      ${BLUE} [82] ${GREEN} Coming Soon...
 ${BLUE} [11] ${GREEN}Coming Soon      ${BLUE} [47] ${GREEN} Coming Soon...      ${BLUE} [83] ${GREEN} Coming Soon...
 ${BLUE} [12] ${GREEN}Coming Soon      ${BLUE} [48] ${GREEN} Coming Soon...      ${BLUE} [84] ${GREEN} Coming Soon...
 ${BLUE} [13] ${GREEN}Coming Soon      ${BLUE} [49] ${GREEN} Coming Soon...      ${BLUE} [85] ${GREEN} Coming Soon...
 ${BLUE} [14] ${GREEN}Coming Soon      ${BLUE} [50] ${GREEN} Coming Soon...      ${BLUE} [86] ${GREEN} Coming Soon...
 ${BLUE} [15] ${GREEN}Coming Soon      ${BLUE} [51] ${GREEN} Coming Soon...      ${BLUE} [87] ${GREEN} Coming Soon...
 ${BLUE} [16] ${GREEN}Coming Soon      ${BLUE} [52] ${GREEN} Coming Soon...      ${BLUE} [88] ${GREEN} Coming Soon...
 ${BLUE} [17] ${GREEN}Coming Soon      ${BLUE} [53] ${GREEN} Coming Soon...      ${BLUE} [89] ${GREEN} Coming Soon...
 ${BLUE} [18] ${GREEN}Coming Soon      ${BLUE} [54] ${GREEN} Coming Soon...      ${BLUE} [90] ${GREEN} Coming Soon...
 ${BLUE} [19] ${GREEN}Coming Soon      ${BLUE} [55] ${GREEN} Coming Soon...      ${BLUE} [91] ${GREEN} Coming Soon...
 ${BLUE} [20] ${GREEN}Coming Soon      ${BLUE} [56] ${GREEN} Coming Soon...      ${BLUE} [92] ${GREEN} Coming Soon...
 ${BLUE} [21] ${GREEN}Coming Soon      ${BLUE} [57] ${GREEN} Coming Soon...      ${BLUE} [93] ${GREEN} Coming Soon...
 ${BLUE} [22] ${GREEN}Coming Soon      ${BLUE} [58] ${GREEN} Coming Soon...      ${BLUE} [94] ${GREEN} Coming Soon...
 ${BLUE} [23] ${GREEN}Coming Soon      ${BLUE} [59] ${GREEN} Coming Soon...      ${BLUE} [95] ${GREEN} Coming Soon...
 ${BLUE} [24] ${GREEN}Coming Soon      ${BLUE} [60] ${GREEN} Coming Soon...      ${BLUE} [96] ${GREEN} Coming Soon...
 ${BLUE} [25] ${GREEN}Coming Soon      ${BLUE} [61] ${GREEN} Coming Soon...      ${BLUE} [97] ${GREEN} Coming Soon...
 ${BLUE} [26] ${GREEN}Coming Soon      ${BLUE} [62] ${GREEN} Coming Soon...      ${BLUE} [98] ${GREEN} Coming Soon...
 ${BLUE} [27] ${GREEN}Coming Soon      ${BLUE} [63] ${GREEN} Coming Soon...      ${BLUE} [99] ${GREEN} Coming Soon...
 ${BLUE} [28] ${GREEN}Coming Soon      ${BLUE} [64] ${GREEN} Coming Soon...      ${BLUE}[100] ${GREEN} Coming Soon...
 ${BLUE} [29] ${GREEN}Coming Soon      ${BLUE} [65] ${GREEN} Coming Soon...      ${BLUE}[101] ${GREEN} Coming Soon...
 ${BLUE} [30] ${GREEN}Coming Soon      ${BLUE} [66] ${GREEN} Coming Soon...      ${BLUE}[102] ${GREEN} Coming Soon...
 ${BLUE} [31] ${GREEN}Coming Soon      ${BLUE} [67] ${GREEN} Coming Soon...      ${BLUE}[103] ${GREEN} Coming Soon...
 ${BLUE} [32] ${GREEN}Coming Soon      ${BLUE} [68] ${GREEN} Coming Soon...      ${BLUE}[104] ${GREEN} Coming Soon...
 ${BLUE} [33] ${GREEN}Coming Soon      ${BLUE} [69] ${GREEN} Coming Soon...      ${BLUE}[105] ${GREEN} Coming Soon...
 ${BLUE} [34] ${GREEN}Coming Soon      ${BLUE} [70] ${GREEN} Coming Soon...      ${BLUE}[106] ${GREEN} Coming Soon...
 ${BLUE} [35] ${GREEN}Coming Soon      ${BLUE} [71] ${GREEN} Coming Soon...      ${BLUE}[107] ${GREEN} Coming Soon...
 ${BLUE} [36] ${GREEN}Coming Soon      ${BLUE} [72] ${GREEN} Coming Soon...      ${BLUE}[108] ${GREEN} Coming Soon...
 
                                                                                        
  ${BOLD}[e] Exit program    ${RED}[u] Update nmap-cli    ${GREEN}[r] Show Scan Results                         
${MAGENTA}_____________________________________________________________________________"
        echo ""
        echo -n -e ${CYAN}"   Please enter your choice: "
        read -r selection
        echo -e "${GREEN}__________________________________________________________________________"
        portscan(){
            clear
            banner
            echo -e "${GREEN}[!] Enter you target IP to scan:" 
            read -r "IP"
            sudo nmap "$IP" >> scanresult.txt
        }
        
        vulnscan(){
            clear
            banner
            echo -e "${YELLOW}[!] Vulnerability Scan Mode Selected "
            echo -e "${GREEN}[!] Enter you target Host to scan:" 
            read -r "Host"
            nmap -sV --script=vulscan/vulscan.nse $Host >> scanresult.txt
        }

        stealthscan(){
            clear
            banner
            echo -e "${YELLOW}[!]Stealh Scan Mode Selected"
            echo ""
            echo -e "${GREEN}[!] Enter you target IP to scan:" 
            read -r "IP"
            sudo nmap "$IP" >> scanresult.txt
        }

        report(){
            clear
            banner
            cat scanresult.txt | lolcat
            read -n 1 -s -r -p "[✓] any key to continue"
            clear
            banner
        }
#######################################################################################
        synport_ss(){
            clear
            banner
            echo -e "${YELLOW}[!]TCP SYN port scan"
            echo ""
            echo -e "${GREEN}[!] Enter you target IP to scan:" 
            read -r "IP"
            sudo nmap "$IP" -sS >> scanresult.txt            
        }

        tcpport_st(){
            clear
            banner
            echo -e "${YELLOW}[!]TCP connect port scan"
            echo ""
            echo -e "${GREEN}[!] Enter you target IP to scan:" 
            read -r "IP"
            sudo nmap "$IP" -sT >> scanresult.txt            
        }

        udpport_su(){
            clear
            banner
            echo -e "${YELLOW}[!]UDP port scan"
            echo ""
            echo -e "${GREEN}[!] Enter you target IP to scan:" 
            read -r "IP"
            sudo nmap "$IP" -sU >> scanresult.txt    
            banner        
        }

        tcpport_sa(){
            clear
            banner
            echo -e "${YELLOW}[!]TCP ACK port scan"
            echo ""
            echo -e "${GREEN}[!] Enter you target IP to scan:" 
            read -r "IP"
            sudo nmap "$IP" -sA >> scanresult.txt
            banner            
        }

        tcpwinport(){
            clear
            banner
            echo -e "${YELLOW}[!]TCP Windows port scan"
            echo ""
            echo -e "${GREEN}[!] Enter you target IP to scan:" 
            read -r "IP"
            sudo nmap "$IP" -sW >> scanresult.txt
            banner            
        }

        tcpmaiport(){
            clear
            banner
            echo -e "${YELLOW}[!]TCP Maimon port scan"
            echo ""
            echo -e "${GREEN}[!] Enter you target IP to scan:" 
            read -r "IP"
            sudo nmap "$IP" -sM >> scanresult.txt
            banner           
        }        
#######################################################################################
        case $selection in
            1) portscan;;
            2) vulnscan;;
            3) stealthscan;; 
      	    4) synport_st;;
		    5) udpport_su;;	
			6) tcpport_sa;;
			7) tcpwinport;;
            8) tcpmaiport;;
            9) exit;;
            10) exit;;
            11) exit;;
            12) exit;;
			r) report;;
            u) update;;
            exit) exit;;
            *) echo "Please choose a number or type exit"
        esac
    done
}

init(){
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
echo -e "${YELLOW} [!] Check dependecies :)"
echo ""
sleep 1
fi
if ! hash nmap 2>/dev/null;then
    echo ""
	echo -e $RED "[✗] The Package nmap is in not istalled"
    echo ""
	apt-get install nmap -y || 2&>/var/logs/nmapclierror.log
else
    echo ""
	echo -e $GREEN "[✓] The Package nmap is installed"  
fi	
sleep 0.2
if ! hash lolcat 2>/dev/null;then
    echo ""
    echo -e  $RED "[✗] The Package lolcat is not installed"
    echo ""
    apt-get install lolcat -y || 2&>/var/logs/nmapcli-error.log
else
    echo ""
    echo -e $GREEN "[✓] The Package lolcat is installed"
fi	
sleep 0.2
if ! hash figlet 2>/dev/null;then
	echo ""
    echo -e $RED "[✗] The Package figlet is not installed"
    echo ""
	apt-get install figlet -y || 2&>/var/logs/nmapcli-error.log
else
    echo ""
	echo -e $GREEN "[✓] The Package figlet is installed"
fi
sleep 0.2
if ! hash git 2>/dev/null;then
    echo ""
    echo -e $RED "[✗] The Package git is not installed" 
    echo ""
    apt-get install git -y || 2&>/var/logs/nmapcli-error.log
else
    echo ""
    echo -e $GREEN "[✓] The Package git is installed"
fi	
if ! hash figlet 2>/dev/null;then
	echo ""
    echo -e $RED "[✗] The Package vulscan is not installed"
	git clone https://github.com/scipag/vulscan scipag_vulscan 2&> /var/logs/nmapclierror.log
    ln -s `pwd`/scipag_vulscan /usr/share/nmap/scripts/vulscan 2&> /var/logs/nmapclierror.log
else
    echo ""
	echo -e $GREEN "[✓] The Package vulnscan is installed"
fi
sleep 1
echo ""
echo "loading menu...please wait"
sleep 1.5
clear
banner
menu
}

loader(){
    if [[ -s nmapcli.installed ]];then
    clear
    banner
    root
    menu
    else
    banner
    init
    fi
}
while no_ctrlc; do
    clear
    loader
    clear
    banner
    menu
done