#!/bin/bash
#Autoscript-Lite By ReyzVPN
GitUser="GH-reyz"
MYIP=$(curl -sS ipv4.icanhazip.com)
P='\e[0;35m'
B='\033[0;36m'
N='\e[0m'
# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'
clear
domain=$(cat /usr/local/etc/xray/domain)
# STATUS EXPIRED ACTIVE
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[4$below" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}(Active)${Font_color_suffix}"
Error="${Green_font_prefix}${Font_color_suffix}${Red_font_prefix}[EXPIRED]${Font_color_suffix}"

# CERTIFICATE STATUS
d1=$(date -d "$valid" +%s)
d2=$(date -d "$today" +%s)
certifacate=$(((d1 - d2) / 86400))
version=$(cat /home/ver)
ver=$( curl https://raw.githubusercontent.com/${GitUser}/version/main/version.conf )
clear
# CEK UPDATE
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info1="${Green_font_prefix}($version)${Font_color_suffix}"
Info2="${Green_font_prefix}(LATEST VERSION)${Font_color_suffix}"
Error="Version ${Green_font_prefix}[$ver]${Font_color_suffix} available${Red_font_prefix}[Please Update]${Font_color_suffix}"
version=$(cat /home/ver)
new_version=$( curl https://raw.githubusercontent.com/${GitUser}/version/main/version.conf | grep $version )
#Status Version
if [ $version = $new_version ]; then
stl="${Info2}"
else
stl="${Error}"
fi
clear
# USERNAME
rm -f /usr/bin/user
username=$(curl https://raw.githubusercontent.com/${GitUser}/allow1/main/ipvps.conf | grep $MYIP | awk '{print $2}')
echo "$username" >/usr/bin/user
# Order ID
rm -f /usr/bin/ver
user=$(curl https://raw.githubusercontent.com/${GitUser}/allow1/main/ipvps.conf | grep $MYIP | awk '{print $3}')
echo "$user" >/usr/bin/ver
# validity
rm -f /usr/bin/e
valid=$(curl https://raw.githubusercontent.com/${GitUser}/allow1/main/ipvps.conf | grep $MYIP | awk '{print $4}')
echo "$valid" >/usr/bin/e
# DETAIL ORDER
username=$(cat /usr/bin/user)
oid=$(cat /usr/bin/ver)
exp=$(cat /usr/bin/e)
clear
today=$(date -d "0 days" +"%Y-%m-%d")
Exp1=$(curl https://raw.githubusercontent.com/jiwakentantal/allow1/main/ipvps.conf | grep $MYIP | awk '{print $4}')
if [[ $today < $Exp1 ]]; then
    sts="${Info}"
else
    sts="${Error}"
fi
echo -e "\e[32mloading...\e[0m"
clear
# PROVIDED
creditt=$(cat /root/provided)
# BANNER COLOUR
banner_colour=$(cat /etc/banner)
# TEXT ON BOX COLOUR
box=$(cat /etc/box)
# LINE COLOUR
line=$(cat /etc/line)
# TEXT COLOUR ON TOP
text=$(cat /etc/text)
# TEXT COLOUR BELOW
below=$(cat /etc/below)
# BACKGROUND TEXT COLOUR
back_text=$(cat /etc/back)
# NUMBER COLOUR
number=$(cat /etc/number)
# BANNER
banner=$(cat /usr/bin/bannerku)
ascii=$(cat /usr/bin/test)

# // nginx status
nginx=$( systemctl status nginx | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $nginx == "running" ]]; then
    status_nginx="${GREEN}ON${NC}"
else
    status_nginx="${RED}OFF${NC}"
fi

# // xray status
xray=$( systemctl status xray | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $xray == "running" ]]; then
    status_xray="${GREEN}ON${NC}"
else
    status_xray="${RED}OFF${NC}"
fi
echo -e "\e[$banner_colour"
figlet -f $ascii "$banner"
echo -e "\e[$text Premium Script"
echo -e "\e[36m╒════════════════════════════════════════════╕\033[0m"
echo -e " \E[0;41;36m                 INFO SERVER                \E[0m"
echo -e "\e[36m╘════════════════════════════════════════════╛\033[0m"
uphours=`uptime -p | awk '{print $2,$3}' | cut -d , -f1`
upminutes=`uptime -p | awk '{print $4,$5}' | cut -d , -f1`
uptimecek=`uptime -p | awk '{print $6,$7}' | cut -d , -f1`
cekup=`uptime -p | grep -ow "day"`
IPVPS=$(curl -s icanhazip.com/ip )
if [ "$cekup" = "day" ]; then
echo -e " System Uptime       :  $uphours $upminutes $uptimecek"
else
echo -e " System Uptime       :  $uphours $upminutes"
fi
echo -e " VPN Core            :  XRAY-Core"
echo -e " Domain              :  $domain"
echo -e " IP VPS              :  $IPVPS"
echo -e " Order ID            :  $oid"
echo -e " Certificate Status  :  Expired in $certifacate days"
echo -e " Provided By         :  $creditt"
echo -e "\e[36m╒════════════════════════════════════════════╕\033[0m"
echo -e "     [ XRAY-CORE${NC} : ${status_xray} ]   [ NGINX${NC} : ${status_nginx} ]"
echo -e "\e[36m╘════════════════════════════════════════════╛\033[0m"
echo -e "\e[36m╒════════════════════════════════════════════╕\033[0m"
echo -e " \E[0;41;36m                 XRAY MENU                  \E[0m"
echo -e "\e[36m╘════════════════════════════════════════════╛\033[0m
 [\033[1;36m•1 \033[0m]  XRAY Vmess WS Panel
 [\033[1;36m•2 \033[0m]  XRAY Vless WS Panel
 [\033[1;36m•3 \033[0m]  XRAY Trojan WS Panel
 [\033[1;36m•4 \033[0m]  XRAY Vless TCP XTLS Panel
 [\033[1;36m•5 \033[0m]  XRAY Trojan TCP Panel
 [\033[1;36m•6 \033[0m]  Trojan GO Panel"
echo -e "\e[36m╒════════════════════════════════════════════╕\033[0m"
echo -e " \E[0;41;36m                SYSTEM MENU                 \E[0m"
echo -e "\e[36m╘════════════════════════════════════════════╛\033[0m
 [\033[1;36m•7 \033[0m]  Change Domain
 [\033[1;36m•8 \033[0m]  Menu Themes
 [\033[1;36m•9 \033[0m]  Renew Certificate XRAY
 [\033[1;36m•10\033[0m]  Check VPN Status
 [\033[1;36m•11\033[0m]  INFO All Port
 [\033[1;36m•12\033[0m]  Restart VPN Services
 [\033[1;36m•13\033[0m]  Speedtest VPS
 [\033[1;36m•14\033[0m]  Check RAM
 [\033[1;36m•15\033[0m]  DNS Changer
 [\033[1;36m•16\033[0m]  Netflix Checker
 [\033[1;36m•17\033[0m]  Backup
 [\033[1;36m•18\033[0m]  Restore
"
echo -e " \033[1;37mPress [ Ctrl+C ] • To-Exit-Script\033[0m"
echo ""
echo -e "\e[36m╒════════════════════════════════════════════╕\033[0m"
echo -e " Version       : $stl"
echo -e " Autoscript By : @GHReyz $Info1"
echo -e " Expiry Script : $exp $sts"
echo -e " Client Name   : $username"
echo -e "\e[36m╘════════════════════════════════════════════╛\033[0m"
echo
echo -ne "Select menu : "; read x
if [[ $(cat /opt/.ver) = $serverV ]] > /dev/null 2>&1; then
    if [[ $x -eq 1 ]]; then
       menu-ws
       read -n1 -r -p "Press any key to continue..."
       menu
    elif [[ $x -eq 2 ]]; then
       menu-vless
       read -n1 -r -p "Press any key to continue..."
       menu
    elif [[ $x -eq 3 ]]; then
       menu-tr
       read -n1 -r -p "Press any key to continue..."
       menu
    elif [[ $x -eq 4 ]]; then
       menu-xray
       read -n1 -r -p "Press any key to continue..."
       menu
    elif [[ $x -eq 5 ]]; then
       menu-xtr
       read -n1 -r -p "Press any key to continue..."
       menu
    elif [[ $x -eq 6 ]]; then
       menu-trgo
       read -n1 -r -p "Press any key to continue..."
       menu
    elif [[ $x -eq 7 ]]; then
       add-host
       read -n1 -r -p "Press any key to continue..."
       menu
    elif [[ $x -eq 8 ]]; then
       themes
       read -n1 -r -p "Press any key to continue..."
       menu
   elif [[ $x -eq 9 ]]; then
       certxray
       read -n1 -r -p "Press any key to continue..."
       menu
    elif [[ $x -eq 10 ]]; then
       status
       read -n1 -r -p "Press any key to continue..."
       menu
    elif [[ $x -eq 11 ]]; then
       info
       read -n1 -r -p "Press any key to continue..."
       menu
    elif [[ $x -eq 12 ]]; then
       restart
       menu
    elif [[ $x -eq 13 ]]; then
       clear
       speedtest
           echo ""
       read -n1 -r -p "Press any key to continue..."
       menu
    elif [[ $x -eq 14 ]]; then
       clear
       ram
           echo ""
       read -n1 -r -p "Press any key to continue..."
       menu
    elif [[ $x -eq 15 ]]; then
       dns
           echo ""
       menu
    elif [[ $x -eq 16 ]]; then
       clear
       nf
           echo ""
       read -n1 -r -p "Press any key to continue..."
       menu
    elif [[ $x -eq 17 ]]; then
       backup
       read -n1 -r -p "Press any key to continue..."
       menu
    elif [[ $x -eq 18 ]]; then
       restore
       read -n1 -r -p "Press any key to continue..."
       menu
    else
       menu
    fi
fi
