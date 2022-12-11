#!/bin/bash
#wget https://github.com/${GitUser}/
clear
GitUser="GH-reyz"
MYIP=$(curl -sS ipv4.icanhazip.com)
#Colour
white='\e[0;37m'
green='\e[0;32m'
red='\e[0;31m'
blue='\e[0;34m'
cyan='\e[0;36m'
yellow='\e[0;33m'
NC='\e[0m'
clear
echo ""
fun_bar () {
comando[0]="$1"
comando[1]="$2"
 (
[[ -e $HOME/fim ]] && rm $HOME/fim
${comando[0]} -y > /dev/null 2>&1
${comando[1]} -y > /dev/null 2>&1
touch $HOME/fim
 ) > /dev/null 2>&1 &
 tput civis
echo -ne "  \033[1;34mLoading \033[1;36m- \033[1;34m["
while true; do
   for((i=0; i<2; i++)); do
   echo -ne "\033[1;36m#"
   sleep 0.1s
   done
   [[ -e $HOME/fim ]] && rm $HOME/fim && break
   echo -e "\033[1;34m]"
   sleep 1s
   tput cuu1
   tput dl1
   echo -ne "  \033[1;34mWait \033[1;34m- \033[1;34m["
done
echo -e "\033[1;34m]\033[1;36m -\033[1;32m OK !\033[1;37m"
tput cnorm
}
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
Exp1=$(curl https://raw.githubusercontent.com/GH-reyz/allow1/main/ipvps.conf | grep $MYIP | awk '{print $4}')
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
clear
echo -e "\e[$banner_colour"
figlet -f $ascii "$banner"
echo -e "\e[$text Premium Script"
echo -e "${blue}════════════════════════════════════════════════════════════${NC}"
tput setaf 7 ; tput setab 6 ; tput bold ; printf '%45s%s%-15s\n' "WELCOME TO PREMIUM SCRIPT " ; tput sgr0
echo -e "${blue}════════════════════════════════════════════════════════════${NC}"
uphours=`uptime -p | awk '{print $2,$3}' | cut -d , -f1`
upminutes=`uptime -p | awk '{print $4,$5}' | cut -d , -f1`
uptimecek=`uptime -p | awk '{print $6,$7}' | cut -d , -f1`
cekup=`uptime -p | grep -ow "day"`
IPVPS=$(curl -s icanhazip.com/ip )
if [ "$cekup" = "day" ]; then
echo -e " ${white} System Uptime       : ${green} $uphours $upminutes $uptimecek"
else
echo -e " ${white} System Uptime       : ${green} $uphours $upminutes"
fi
echo -e " ${white} VPN Core            : ${green} XRAY-Core$NC"
echo -e " ${white} Domain              : ${green} $domain$NC"
echo -e " ${white} IP VPS              : ${green} $IPVPS$NC"
echo -e " ${white} Order ID            : ${green} $oid$NC"
echo -e " ${white} Provided By         : ${green} $creditt $NC"
echo -e " ${white} Client Name         : ${green} $username $NC"
echo -e " ${white} Expiry Script       : ${green} $exp $sts $NC"
echo -e " ${white} Autoscript By       : ${green} @GHReyz"
echo -e "${blue}════════════════════════════════════════════════════════════${NC}"
echo -e "\\E[0;46;30m                        TUNNELING MENU                      \E[0m"
echo -e "${blue}════════════════════════════════════════════════════════════${NC}"
echo -e "  $green[${white}1${green}] ${green} SSH & OpenVPN Panel$NC"
echo -e "  $green[${white}2${green}] ${green} XRAY Vmess WS Panel$NC"
echo -e "  $green[${white}3${green}] ${green} XRAY Vless WS Panel$NC"
echo -e "  $green[${white}4${green}] ${green} XRAY Trojan WS Panel$NC"
echo -e "  $green[${white}5${green}] ${green} XRAY Vless TCP XTLS Panel$NC"
echo -e "  $green[${white}6${green}] ${green} XRAY Trojan TCP Panel$NC"
echo -e "  $green[${white}7${green}] ${green} Trojan GO Panel$NC"
echo -e "${blue}════════════════════════════════════════════════════════════${NC}"
echo -e "\\E[0;46;30m                        SYSTEM MENU                         \E[0m"
echo -e "${blue}════════════════════════════════════════════════════════════${NC}"
echo -e "  $green[${white}8${green}] ${green}Change Domain ${cyan}(add-host)$NC"
echo -e "  $green[${white}9${green}] ${green}Menu Themes ${cyan}(themes)$NC"
echo -e "  $green[${white}10${green}] ${green}Renew Certificate XRAY ${cyan}(cert)$NC"
echo -e "  $green[${white}11${green}] ${green}Check VPN Statusn ${cyan}(status)$NC"
echo -e "  $green[${white}12${green}] ${green}INFO All Port ${cyan}(info)$NC"
echo -e "  $green[${white}13${green}] ${green}Restart VPN Servicesn${cyan}(restart)$NC"
echo -e "  $green[${white}14${green}] ${green}Speedtest VPS ${cyan}(speedtest)$NC"
echo -e "  $green[${white}15${green}] ${green}Check RAM ${cyan}(ram)$NC"
echo -e "  $green[${white}16${green}] ${green}DNS Changer ${cyan}(dns)$NC"
echo -e "  $green[${white}17${green}] ${green}Netflix Checker ${cyan}(nf)$NC"
echo -e "  $green[${white}18${green}] ${green}Check Bandwith Server ${cyan}(vnstat)$NC"
echo -e "  $green[${white}19${green}] ${green}Backup ${cyan}(backup)$NC"
echo -e "  $green[${white}20${green}] ${green}Restore ${cyan}(restore)$NC"
echo -e "${blue}════════════════════════════════════════════════════════════${NC}"
echo -e "      ${cyan} [ XRAY-CORE${NC} : ${status_xray} ]          ${cyan} [ NGINX${NC} : ${status_nginx} ]"
echo -e "${blue}════════════════════════════════════════════════════════════${NC}"
read -p "  $(echo -e     ${white}Enter Your Options  ${green}[${NC}${white}1-20 or x${green}]${NC} :)  "  main
echo -e ""
case $main in
1)
add-ssh
;;
2)
menu-ws
;;
3)
menu-vless
;;
4)
menu-tr
;;
5)
menu-xray
;;
6)
menu-xtr
;;
7)
menu-trgo
;;
8)
add-host
;;
9)
themes
;;
10)
certxray
;;
11)
status
;;
12)
info
;;
13)
restart
;;
14)
speedtest
;;
15)
ram
;;
16)
dns
;;
17)
nf
;;
18)
vnstat
;;
19)
backup
;;
20)
restore
;;
0)
exit
;;
*)
echo -e "${red}Please enter an correct number ${NC}"
sleep 1
menu
;;
esac
