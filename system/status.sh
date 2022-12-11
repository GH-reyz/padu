#!/bin/bash
#Autoscript-Lite By pakyavpn
#wget https://github.com/${GitUser}/
GitUser="GH-reyz"
red='\e[1;31m'
green='\e[0;32m'
purple='\e[0;35m'
orange='\e[0;33m'
NC='\e[0m'
clear
echo -e ""
echo -e "\e[34m╒════════════════════════════════════════════╕\033[0m"
echo -e " \E[0;46;30m                SYSTEM STATUS               \E[0m"
echo -e "\e[34m╘════════════════════════════════════════════╛\033[0m"
status="$(systemctl show ssh.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Open SSH                       : "$green"running"$NC" "
else
echo -e " Open SSH                       : "$red"not running (Error)"$NC" "
fi

status="$(systemctl show --now openvpn-server@server-tcp-1194 --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " OpenVPN TCP                    : "$green"running"$NC" "
else
echo -e " OpenVPN TCP                    : "$red"not running (Error)"$NC" "
fi

status="$(systemctl show --now openvpn-server@server-udp-2200 --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " OpenVPN UDP                    : "$green"running"$NC" "
else
echo -e " OpenVPN UDP                   : "$red"not running (Error)"$NC" "
fi

status="$(systemctl show stunnel4.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Stunnel(SSL)                   : "$green"running"$NC" "
else
echo -e " Stunnel(SSL)                   : "$red"not running (Error)"$NC" "
fi

status="$(systemctl show dropbear.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " DropBear                       : "$green"running"$NC" "
else
echo -e " DropBear                       : "$red"not running (Error)"$NC" "
fi

status="$(systemctl show cron.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Cron				: "$green"Running"$NC""
else
echo -e " Cron				: "$red"Not Running (Error)"$NC""
fi

status="$(systemctl show nginx.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Nginx				: "$green"Running"$NC""
else
echo -e " Nginx				: "$red"Not Running (Error)"$NC""
fi

status="$(systemctl show fail2ban.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Fail2ban			: "$green"Running"$NC""
else
echo -e " Fail2ban			: "$red"Not Running (Error)"$NC""
fi

status="$(systemctl show xray.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " XRAY Vmess TLS			: "$green"Running"$NC""
else
echo -e " XRAY Vmess TLS			: "$red"Not Running (Error)"$NC""
fi

status="$(systemctl show xray@none.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " XRAY Vmess None TLS		: "$green"Running"$NC""
else
echo -e " XRAY Vmess None TLS		: "$red"Not Running (Error)"$NC""
fi

status="$(systemctl show xray@vless.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " XRAY Vless TLS			: "$green"Running"$NC""
else
echo -e " XRAY Vless TLS			: "$red"Not Running (Error)"$NC""
fi

status="$(systemctl show xray@vnone.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " XRAY Vless None TLS		: "$green"Running"$NC""
else
echo -e " XRAY Vless None TLS		: "$red"Not Running (Error)"$NC""
fi

status="$(systemctl show xray@trojanws.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " XRAY Trojan TLS		: "$green"Running"$NC""
else
echo -e " XRAY Trojan TLS		: "$red"Not Running (Error)"$NC""
fi

status="$(systemctl show xray@trnone.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " XRAY Trojan None TLS		: "$green"Running"$NC""
else
echo -e " XRAY Trojan None TLS		: "$red"Not Running (Error)"$NC""
fi

status="$(systemctl show xray@xtls.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " XRAY Vless TCP XTLS		: "$green"Running"$NC""
else
echo -e " XRAY Vless TCP XTLS		: "$red"Not Running (Error)"$NC""
fi

status="$(systemctl show xray@trojan.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " XRAY Trojan TCP TLS		: "$green"Running"$NC""
else
echo -e " XRAY Trojan TCP TLS		: "$red"Not Running (Error)"$NC""
fi

status="$(systemctl show trojan-go.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Trojan GO WS		        : "$green"Running"$NC""
else
echo -e " Trojan GO WS      		: "$red"Not Running (Error)"$NC""
fi

status="$(systemctl show squid.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Squid                          : "$green"running"$NC" "
else
echo -e " Squid                          : "$red"not running (Error)"$NC" "
fi

echo -e "\e[0;34m-----------------------------------------------------------\e[0m"
echo -e ""
echo -e "${green}JIKA TERDAPAT NOT RUNNING, PLEASE REPORT TO ADMIN FOR FIX$NC"
echo -e "${green}Report to ReyzVPN @GHReyz$NC"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
