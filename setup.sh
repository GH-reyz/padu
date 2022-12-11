#!/bin/bash
#wget https://github.com/${GitUser}/
GitUser="GH-reyz"
# Color Validation
Lred='\e[1;91m'
Lgreen='\e[92m'
Lyellow='\e[93m'
green='\e[32m'
RED='\033[0;31m'
NC='\033[0m'
BGBLUE='\e[1;44m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
purple='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0;37m'
# ===================
echo ''
clear
echo ''
echo -e "$Lyellow                ⚡ PREMIUM SPEED SCRIPT ⚡"$NC
echo -e "$green.........................................................."$NC
echo -e "$Lyellow                  Autoscript By ReyzVPN"$NC
echo -e "$Lyellow                    CONTACT TELEGRAM"$NC
echo -e "$Lyellow                       @GHReyz"$NC
echo -e "$Lyellow                       @Reyz-V4"$NC
echo -e "$green.........................................................."$NC
echo ''
echo -e "$Lyellow                       Tunggu 6 Saat!"$NC
echo -e "$green.........................................................."$NC
sleep 6
clear
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
clear
# Valid Script
VALIDITY() {
    today=$(date -d "0 days" +"%Y-%m-%d")
    Exp1=$(curl https://raw.githubusercontent.com/${GitUser}/allow1/main/ipvps.conf | grep $MYIP | awk '{print $4}')
    if [[ $today < $Exp1 ]]; then
        echo -e "\e[32mTahniah! Anda Dibenarkan menggunakan AUTOSCRIPT ReyzVPN..\e[0m"
        sleep 5
    else
        echo -e "\e[31mYOUR SCRIPT HAS EXPIRED!\e[0m"
        echo -e "\e[31mPlease renew your ipvps first\e[0m"
        exit 0
    fi
}
IZIN=$(curl https://raw.githubusercontent.com/${GitUser}/allow1/main/ipvps.conf | awk '{print $5}' | grep $MYIP)
if [ $MYIP = $IZIN ]; then
    echo -e "\e[32mPermission Accepted...\e[0m"
    VALIDITY
else
    echo -e "\e[31mPermission Denied!\e[0m"
    echo -e "\e[31mPlease buy script first\e[0m"
    rm -f setup.sh
    exit 0
fi
clear
secs_to_human() {
    echo "Installation time : $(( ${1} / 3600 )) hours $(( (${1} / 60) % 60 )) minutes $(( ${1} % 60 )) seconds"
}
start=$(date +%s)
if [ -f "/usr/local/etc/xray/domain" ]; then
echo "Script Already Installed"
exit 0
fi
mkdir /var/lib/premium-script;
mkdir /var/lib/crot-script;
clear
clear
#Nama penyedia script
echo -e "\e[1;32m════════════════════════════════════════════════════════════\e[0m"
echo ""
echo -e "   \e[1;32mPlease enter the name of Provider for Script."
read -p "   Client Name : " nm
echo $nm > /root/provided
echo ""
echo -e "\e[1;32m════════════════════════════════════════════════════════════\e[0m"
echo ""
echo -e "   .----------------------------------."
echo -e "   |\e[1;32mPlease select a domain type below \e[0m|"
echo -e "   '----------------------------------'"
echo -e "     \e[1;32m1)\e[0m Enter your Subdomain"
echo -e "     \e[1;32m2)\e[0m Use A Random Subdomain"
echo -e "   ------------------------------------"
read -p "   Please select numbers 1-2 or Any Button(Random) : " padu
echo ""
if [[ $padu == "1" ]]; then
echo -e "   \e[1;32mPlease enter your subdomain "
read -p "   Subdomain: " host
echo "IP=$host" >> /var/lib/premium-script/ipvps.conf
echo "IP=$host" >> /var/lib/crot-script/ipvps.conf
echo "$host" >> /root/domain
echo ""
elif [[ $padu == "2" ]]; then
#install cf
wget https://raw.githubusercontent.com/${GitUser}/padu/main/install/cf.sh && chmod +x cf.sh && ./cf.sh
rm -f /root/cf.sh
clear
else
echo -e "Random Subdomain/Domain is used"
wget https://raw.githubusercontent.com/${GitUser}/padu/main/install/cf.sh && chmod +x cf.sh && ./cf.sh
rm -f /root/cf.sh
clear
fi
echo ""
clear
echo -e "\e[0;32mREADY FOR INSTALLATION SCRIPT...\e[0m"
echo -e ""
sleep 1
#Install SSH-VPN
echo -e "\e[0;32mINSTALLING SSH-VPN...\e[0m"
sleep 1
wget https://raw.githubusercontent.com/${GitUser}/padu/main/install/ssh-vpn.sh && chmod +x ssh-vpn.sh && ./ssh-vpn.sh
echo -e "\e[0;32mDONE INSTALLING SSH-VPN\e[0m"
echo -e ""
sleep 1
#Install Xray
echo -e "\e[0;32mINSTALLING XRAY CORE...\e[0m"
sleep 1
wget https://raw.githubusercontent.com/${GitUser}/padu/main/install/ins-xray.sh && chmod +x ins-xray.sh && screen -S ins-xray ./ins-xray.sh
echo -e "\e[0;32mDONE INSTALLING XRAY CORE\e[0m"
echo -e ""
sleep 1
clear
#Install SET-BR
echo -e "\e[0;32mINSTALLING SET-BR...\e[0m"
sleep 1
wget https://raw.githubusercontent.com/${GitUser}/padu/main/install/set-br.sh && chmod +x set-br.sh && ./set-br.sh
echo -e "\e[0;32mDONE INSTALLING SET-BR...\e[0m"
echo -e ""
sleep 1
clear
# set time GMT +8
ln -fs /usr/share/zoneinfo/Asia/Kuala_Lumpur /etc/localtime
# install clouflare JQ
apt install jq curl -y

#finish
rm -f /root/ins-xray.sh
rm -f /root/set-br.sh
rm -f /root/ssh-vpn.sh

# move client name to xray folder
mv /root/user /usr/local/etc/xray/

# Colour Default
echo "1;36m" > /etc/banner
echo "30m" > /etc/box
echo "1;31m" > /etc/line
echo "1;32m" > /etc/text
echo "1;33m" > /etc/below
echo "47m" > /etc/back
echo "1;35m" > /etc/number
echo 3d > /usr/bin/test
# Version
ver=$( curl https://raw.githubusercontent.com/${GitUser}/version/main/version.conf )
history -c
echo "$ver" > /home/ver
clear
echo ""
echo ""
echo -e "    .-------------------------------------------."
echo -e "    |      Installation Has Been Completed      |"
echo -e "    '-------------------------------------------'"
echo ""
echo ""
echo -e "\e[1;32m═════════════════════[-Autoscript-Premium-]═════════════════════${NC}" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "    >>> Service Details <<<"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "    [INFORMASI SSH & OpenVPN]" | tee -a log-install.txt
echo -e "${purple}   --------------------${NC}" | tee -a log-install.txt
echo "   - OpenSSH                 : 22"  | tee -a log-install.txt
echo "   - OpenVPN                 : TCP 1194, UDP 2200"  | tee -a log-install.txt
echo "   - OpenVPN SSL             : 110"  | tee -a log-install.txt
echo "   - Stunnel4                : 222, 777"  | tee -a log-install.txt
echo "   - Dropbear                : 143, 109"  | tee -a log-install.txt
echo "   - Websocket SSH(HTTP)     : 80"  | tee -a log-install.txt
echo "   - Websocket SSL(HTTPS)    : 443, 2096"  | tee -a log-install.txt
echo "   - Websocket OpenVPN       : 2097"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "    [INFORMASI Sqd, Bdvp, Ngnx]" | tee -a log-install.txt
echo "    ---------------------------" | tee -a log-install.txt
echo "   - Squid Proxy             : 3128, 8080 (limit to IP Server)"  | tee -a log-install.txt
echo "   - Badvpn                  : 7100, 7200, 7300"  | tee -a log-install.txt
echo "   - Nginx                   : 81"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   [ XRAY INFORMATION ]" | tee -a log-install.txt
echo -e "${purple}   --------------------${NC}" | tee -a log-install.txt
echo "   - XRAY VMESS WS TLS       : 443"  | tee -a log-install.txt
echo "   - XRAY VLESS WS TLS       : 443"  | tee -a log-install.txt
echo "   - XRAY VLESS TCP XTLS     : 443"  | tee -a log-install.txt
echo "   - XRAY VMESS WS None TLS  : 80"  | tee -a log-install.txt
echo "   - XRAY VLESS WS None TLS  : 80"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "    [INFORMASI TROJAN]"  | tee -a log-install.txt
echo -e "${purple}   --------------------${NC}" | tee -a log-install.txt
echo "   - XRAY TROJAN TCP TLS     : 443"  | tee -a log-install.txt
echo "   - XRAY TROJAN WS TLS      : 443"  | tee -a log-install.txt
echo "   - XRAY TROJAN WS None TLS : 80"  | tee -a log-install.txt
echo "   - TROJAN GO WS            : 8000"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   [ YAML INFORMATION ]" | tee -a log-install.txt
echo -e "${purple}   --------------------${NC}" | tee -a log-install.txt
echo "   - YAML XRAY VMESS WS"  | tee -a log-install.txt
echo "   - YAML XRAY VLESS WS"  | tee -a log-install.txt
echo "   - YAML XRAY TROJAN WS"  | tee -a log-install.txt
echo "   - YAML XRAY VLESS XTLS"  | tee -a log-install.txt
echo "   - YAML XRAY TROJAN TCP"  | tee -a log-install.txt
echo "   - YAML TROJAN GO"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   [ SERVER INFORMATION ]"  | tee -a log-install.txt
echo -e "${purple}   ----------------------${NC}" | tee -a log-install.txt
echo "   - Timezone                : Asia/Kuala_Lumpur (GMT +8)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPV6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On 06.00 GMT +8" | tee -a log-install.txt
echo "   - Autobackup Data" | tee -a log-install.txt
echo "   - Restore Data" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo "   - White Label" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   [ DEV INFORMATION ]" | tee -a log-install.txt
echo -e "${purple}   -------------------${NC}" | tee -a log-install.txt
echo "   - Autoscript Lite By      : ReyzVPN"  | tee -a log-install.txt
echo "   - Telegram                : t.me/GHReyz"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo -e "\e[1;32m════════════════Autoscript By ReyzVPN════════════════${NC}" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
secs_to_human "$(($(date +%s) - ${start}))" | tee -a log-install.txt
sleep 7
clear
echo ""
echo -e "    \e[1;32m.------------------------------------------.\e[0m"
echo -e "    \e[1;32m|     SUCCESFULLY INSTALLED THE SCRIPT     |\e[0m"
echo -e "    \e[1;32m|         PREMIUM BY @GHReyz / @ReyzV4          |\e[0m"
echo -e "    \e[1;32m'------------------------------------------'\e[0m"
echo ""
echo -e "   \e[1;32mYour VPS Will Be Automatical Reboot In 5 seconds\e[0m"
rm -r setup.sh
sleep 5
reboot
