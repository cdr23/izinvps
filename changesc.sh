# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'

cd /root
#System version number
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi

localip=$(hostname -I | cut -d\  -f1)
hst=( `hostname` )
dart=$(cat /etc/hosts | grep -w `hostname` | awk '{print $2}')
if [[ "$hst" != "$dart" ]]; then
echo "$localip $(hostname)" >> /etc/hosts
fi

clear
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[41;1;39m             ⇱ MENU TOOLS INSTALLER ⇲             \E[0m"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "[${GREEN}01${NC}] ${PURPLE}👉${NC} Install Script V.1 ( ${GREEN}MultiPort${NC} )"
echo -e "[${GREEN}02${NC}] ${PURPLE}👉${NC} Install Script V.2 ( ${GREEN}No MultiPort${NC} )"
echo -e "[${GREEN}03${NC}] ${PURPLE}👉${NC} Install Script Stabil ( ${GREEN}RIDWAN${NC} )"
echo -e "[${GREEN}04${NC}] ${PURPLE}👉${NC} Install Script Xray ( ${GREEN}XRAY-ONLY${NC} )"
echo -e "[${GREEN}00${NC}] ${PURPLE}❌${NC} Exit"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo ""
echo -ne "Select menu : "; read x

case "$x" in 
   1 | 01)
   clear
   apt update ; apt upgrade -y ; wget vip-xdrg45.me/setup.sh ; chmod +x setup.sh ; ./setup.sh
   ;;
   
   2 | 02)
   clear
   rm -f setup.sh && sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sysctl -w net.ipv6.conf.default.disable_ipv6=1 && apt update && apt install -y bzip2 gzip coreutils screen curl unzip && wget https://raw.githubusercontent.com/myridwan/sc/ipuk/setup.sh && chmod +x setup.sh && sed -i -e 's/\r$//' setup.sh && screen -S setup ./setup.sh
   ;;
   
   3 | 03)
   clear
   read -n 1 -s -r -p "Chat Admin Ridwan Store Via Tele ID Tele : @r1f4n_112"
   apt update && apt upgrade -y && wget https://raw.githubusercontent.com/MyRidwan/izinvps/ipuk/setup.sh && chmod +x setup.sh && ./setup.sh
   ;;
   4 | 04)
   clear
   apt update && apt upgrade -y && wget https://raw.githubusercontent.com/myridwan/xray/ipuk/install.sh && chmod +x install.sh && ./install.sh
   ;;
   *)
   xdrg
esac
