#!/bin/bash
#wget https://github.com/${GitUser}/
GitUser="GH-reyz"
# Set-Backup Installation
# By pakyavpn
#-----------------------------
curl https://rclone.org/install.sh | bash
printf "q\n" | rclone config
wget -O /root/.config/rclone/rclone.conf "https://raw.githubusercontent.com/${GitUser}/padu/main/system/rclone.conf"
git clone  https://github.com/MrMan21/wondershaper.git
cd wondershaper
make install
cd
rm -rf wondershaper
cd /usr/bin
wget -O backup "https://raw.githubusercontent.com/${GitUser}/padu/main/system/backup.sh"
wget -O restore "https://raw.githubusercontent.com/${GitUser}/padu/main/system/restore.sh"
wget -O cleaner "https://raw.githubusercontent.com/${GitUser}/padu/main/system/logcleaner.sh"
chmod +x /usr/bin/backup
chmod +x /usr/bin/restore
chmod +x /usr/bin/cleaner
cd
if [ ! -f "/etc/cron.d/cleaner" ]; then
cat> /etc/cron.d/cleaner << END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
*/2 * * * * root /usr/bin/cleaner
END
fi
service cron restart > /dev/null 2>&1
rm -f /root/set-br.sh
