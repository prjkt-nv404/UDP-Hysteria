clear
export GREEN='\e[32m'
export RED='\033[0;31m'
export BGBLUE='\e[1;44m'
export ORANGE='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export BG='\E[44;1;39m'
export NC='\033[0;37m'
export WHITE='\033[0;37m'
export TRY="[${RED} * ${NC}]"
command_exists() {
	command -v "$1" >/dev/null 2>&1
}
install_dependencies() {
	if ! command_exists figlet; then
		echo "Installing figlet..."
		sudo apt-get update
		sudo apt-get install -y figlet
	fi
	if ! command_exists lolcat; then
		echo "Installing lolcat..."
		sudo apt-get update
		sudo apt-get install -y lolcat
		export PATH="/usr/games:$PATH"
		sudo ln -s /usr/games/lolcat /usr/local/bin/lolcat
	fi
}
reboot() {
	clear
	echo -e "${GREEN}System will reboot in 3 seconds...${RESET}"
	sleep 3
	echo ""
	echo -e "${RED}rebooting...${RESET}"
	sudo reboot
}
restart_services() {
	sudo systemctl restart hysteria
	GREEN="\033[0;32m"
	RED="\033[0;31m"
	RESET="\033[0m"
	sudo systemctl restart hysteria
	if systemctl is-active hysteria >/dev/null; then
		echo -e "voltssh-x hysteria server is ${GREEN}active${RESET}."
	else
		echo -e "voltssh-x hysteria server is ${RED}not active${RESET}."
	fi
	if systemctl is-enabled hysteria >/dev/null; then
		echo -e "voltssh-x hysteria server is ${GREEN}enabled${RESET}."
	else
		echo -e "voltssh-x hysteria server is ${RED}not enabled${RESET}."
	fi
	read -n 1 -s -r -p "  Press any key to return ↩︎"
	menu
}
new_auth() {
	clear
	if command_exists figlet && command_exists lolcat; then
		figlet -k Voltssh-X | lolcat && figlet -k Hysteria | lolcat
	else
		echo "Please install 'figlet' and 'lolcat' for better text formatting."
	fi
	echo -e "${BLUE}┌──────────────────────────────────────────────────────•${NC}"
	echo -e "${BLUE}• List ⤵⤵ •${NC}  ${BLUE}•${NC} New Auth - Passwords ${NC}"
	echo -e "${BLUE}•──────────────────────────────────────────────────────•${NC}"
	echo -e "${RED}NOTE: You can only add new Auth Passwords to serve as accounts"
	echo -e "${GREEN}    - Also, you can change Auth passwords @ '/etc/hysteria/config.json'"
	echo -e "${ORANGE}    - OBFS is static, you can only change it @ '/etc/hysteria/config.json'"
	echo ""
	echo ""
	echo -e "${CYAN}OBFS : $(cat /etc/volt/OBFS) ${RESET}"
	echo ""
	python3 /etc/volt/cfgupt.py
	systemctl restart hysteria
	read -n 1 -s -r -p "  Press any key to return ↩︎"
	menu
}
list_auth() {
	clear
	BLUE='\033[1;34m'
	NC='\033[0m' # No Color
	json_file="/etc/hysteria/config.json"
	if ! command -v jq &>/dev/null; then
		echo "Error: jq is not installed. Please install it using your package manager."
		exit 1
	fi
	passwords=$(jq -r '.auth.config[]' "$json_file")
	if [[ -n "$passwords" ]]; then
		if command_exists figlet && command_exists lolcat; then
			figlet -k Voltssh-X | lolcat && figlet -k Hysteria | lolcat
		else
			echo "Please install 'figlet' and 'lolcat' for better text formatting."
		fi
		echo -e "${BLUE}┌────────────────────────────────────────────────────────────────•${NC}"
		echo -e "${BLUE}• List ⤵⤵ •${NC}  ${BLUE}•${NC} Auth - Passwords ${NC}"
		echo -e "${BLUE}•────────────────────────────────────────────────────────────────•${NC}"
		IFS=$'\n' # Set Internal Field Separator to newline
		for password in $passwords; do
			echo -e "${BLUE}• ${password}"
		done
		echo -e "${BLUE}•────────────────────────────────────────────────────────────────•${NC}"
	else
		echo "No passwords found in the System."
	fi
	echo -e ""
	read -n 1 -s -r -p "  Press any key to return ↩︎"
	menu
}
vps_info() {
	clear
	install_dependencies
	DESCRIPTION=$(lsb_release -sd)
	CODENAME=$(lsb_release -sc)
	KERNEL=$(uname -r)
	COUNTRY=$(curl -s "https://ipinfo.io/city")
	PUBLIC_IP=$(curl -s https://api.ipify.org)
	ORG=$(curl -s "https://ipinfo.io/org")
	if command_exists figlet && command_exists lolcat; then
		figlet -k Voltssh-X | lolcat && figlet -k Hysteria | lolcat
	else
		echo "Please install 'figlet' and 'lolcat' for better text formatting."
	fi
	echo -e "$BLUE•──────────────────────────────────────────────•$NC"
	echo -e "$BLUE│$NC       •• VPS INFORMATION ••  $NC"
	echo -e "$BLUE└──────────────────────────────────────────────┘$NC"
	echo -e "$BLUE┌──────────────────────────────────────────────┐$NC"
	echo -e "$BLUE│$NC IP Info : $PUBLIC_IP"
	echo -e "$BLUE│$NC Country : $COUNTRY"
	echo -e "$BLUE│$NC Org     : $ORG"
	echo -e "$BLUE│$NC System  : $DESCRIPTION"
	echo -e "$BLUE│$NC Codename: $CODENAME"
	echo -e "$BLUE│$NC Kernel  : $KERNEL"
	echo -e "$BLUE└──────────────────────────────────────────────┘$NC"
	echo -e "$BLUE•──────────────────────────────────────────────•$NC"
	echo -e ""
	read -n 1 -s -r -p "  Press any key to return ↩︎"
	menu
}
hys_uninstaller() {
	clear
	figlet -k Voltssh-X | lolcat && figlet -k Hysteria | lolcat
	echo ""
	echo -e "\033[1;32m     Uninstaller!\033[1;33m"
	echo -e "$BLUE•──────────────────────────────────────────•$NC"
	read -p "Continue to uninstall script ? [Y/n] " resp
	if [[ "$resp" = y || "$resp" = Y ]]; then
		echo ""
		echo -e " \e[1;33mWishing you the best ahead! 💙\033[0m"
		echo ""
		echo -e " \e[1;33mKindly send you reviews to:\033[0m"
		echo -e " \e[1;33m[ 👨🏽‍💻��𝚘��𝚝��²𝚑 𝕏: @voltsshx ]\033[0m"
		echo -e " \033[92m⇢ Chat ID: https://t.me/voltsshx\033[0m"
		echo -e " \e[1;33mJoin our Channel: LS Tunnels @lstunnels\033[0m"
		echo -e " \033[92m⇢ Channel ID: https://t.me/lstunnels\033[0m"
		echo ""
		echo -e " \033[92m⇢ ALERT: Server May Disconnect!\033[0m"
		sleep 5
		apt-get purge screen -y >/dev/null 2>&1
		apt-get purge nmap -y >/dev/null 2>&1
		apt-get purge dropbear -y >/dev/null 2>&1
		apt-get purge apache2 -y >/dev/null 2>&1
		systemctl stop hysteria &>/dev/null
		systemctl disable hysteria &>/dev/null
		rm -f /etc/systemd/system/hysteria.service &>/dev/null
		rm -rf /etc/volt/hy1 &>/dev/null
		rm -rf /etc/hysteria &>/dev/null
		sudo systemctl stop hysteria-server &>/dev/null
		systemctl disable hysteria-server &>/dev/null
		rm -f /etc/systemd/system/hysteria-server.service &>/dev/null
		rm -f /etc/systemd/system/multi-user.target.wants/hysteria-server.service &>/dev/null
		rm -f /etc/systemd/system/multi-user.target.wants/hysteria-server@*.service &>/dev/null
		systemctl daemon-reload &>/dev/null
		sudo rm -rf /etc/hysteria &>/dev/null
		sudo rm -rf /etc/volt &>/dev/null
		rm -f /etc/systemd/system/hysteria-server.service &>/dev/null
		rm -rf /etc/volt/hy2 &>/dev/null
		rm -rf /etc/hysteria &>/dev/null
		rm -rf /root/hy &>/dev/null
		remove_n_purge() {
			sudo apt-get remove --purge -y \
				apache2 \
				dropbear \
				dos2unix \
				nload \
				jq \
				lolcat \
				figlet \
				screen \
				nodejs \
				npm \
				iptables >/dev/null 2>&1
		}
		remove_n_purge
		rm -rf /etc/volt >/dev/null 2>&1
		sed -i '/figlet -k Voltssh-X | lolcat/,/echo -e ""/d' ~/.bashrc
		sed -i '/figlet -k Hsyteria | lolcat/,/echo -e ""/d' ~/.bashrc
		pkill -9 screen >/dev/null 2>&1
		echo -e "\033[1;36mSuccessfully Uninstalled!\033[1;33m"
		echo ""
		echo -e "READ THIS!(5sec)"
		echo -e "\033[1;36mYou may want to press Ctrl+C to force exit if the menu keep showing.\033[1;33m"
		echo -e "\033[1;36mLol, it's not a bug!\033[1;33m"
		sleep 5
		exit
	else
		echo -e "\033[1;32mYou did not uninstall.\033[1;33m"
		echo -e "\033[1;32mReturning to menu...\033[0;37m"
		sleep 2
		menu
	fi
}
menu() {
	clear
	UDP_PORT_HP=$(cat /etc/volt/UDP_PORT_HP)
	RmtPORT=36712
	if [[ $(systemctl is-active hysteria) == 'active' ]]; then
		state_hysteria="\e[1m\e[32m[ON]"
	else
		state_hysteria="\e[1m\e[31m[OFF]"
	fi
	figlet -k Voltssh-X Hysteria | lolcat
	echo -e "$BLUE┌────────────────────────────────────────────────────────────────•${NC}"
	echo -e "$BLUE│$NC ${ORANGE}•${NC} Version: ${BLUE}voltx 1.3.5${NC}      ${BLUE}•${NC} IPinfo: $(curl -sS ipv4.icanhazip.com)"
	echo -e "$BLUE│$NC ${ORANGE}•${NC} TG-Channel: ${BLUE}@lstunnels${NC}    ${BLUE}•${NC} Domain: $(cat /etc/volt/DOMAIN)"
	echo -e "$BLUE│$NC ${ORANGE}•${NC} DevChat: ${BLUE}@voltsshx${NC}        ${BLUE}•${NC} UPTime: $(uptime -p | sed 's/up //')"
	echo -e "$BLUE└────────────────────────────────────────────────────────────────•${NC}"
	echo -e "$BLUE┌────────────────────────────────────────────────────────────────•$NC"
	echo -e "$BLUE│$NC  Protocol : [$(cat /etc/volt/PROTOCOL)]    ${BLUE}•${NC} UDP Ports : ${RmtPORT}, ${UDP_PORT_HP} $NC"
	echo -e "$BLUE└────────────────────────────────────────────────────────────────•$NC"
	echo -e "$BLUE┌────────────────────────────────────────────────────────────────•$NC"
	echo -e "$BLUE• Default Values ⤵⤵ •$NC   ${BLUE}•${NC} Hysteria: $state_hysteria ${NC}"
	echo -e "$BLUE•────────────────────────────────────────────────────────────────•$NC"
	echo -e "$BLUE│$NC ${CYAN}[Obfs]${NC} ${ORANGE}•${NC} ${WHITE}$(cat /etc/volt/OBFS)${NC}"
	echo -e "$BLUE│$NC ${CYAN}[Auth-Passwords]${NC} ${ORANGE}•${NC} ${WHITE}$(cat /etc/volt/PASSWORD)${NC}"
	echo -e "$BLUE│$NC ${CYAN}[Allow Insecure]${NC} ${ORANGE}•${NC} ${GREEN}[ON]${NC}"
	echo -e "$BLUE└────────────────────────────────────────────────────────────────•$NC"
	echo -e "$BLUE•────────────────────────────────────────────────────────────────┐$NC"
	echo -e " ${BLUE}[01]${NC} ${ORANGE}•${NC} ${WHITE}Create AUTH Passwords${NC}    $BLUE│$NC ${BLUE}[02]${NC} ${ORANGE}•${NC} ${WHITE}List Auth Passwords${NC}"
	echo -e " ${BLUE}[03]${NC} ${ORANGE}•${NC} ${WHITE}Restart Hysteria Service${NC} $BLUE│$NC ${BLUE}[04]${NC} ${ORANGE}•${NC} ${WHITE}System Info${NC}"
	echo -e "$BLUE•────────────────────────────────────────────────────────────────┘${NC}"
	echo -e "$BLUE┌─────────────────────────┐${NC}"
	echo -e "$BLUE│$NC ${BLUE}[88]${NC} ${ORANGE}•${NC} ${WHITE}Reboot Server${NC}"
	echo -e "$BLUE│$NC ${BLUE}[99]${NC} ${ORANGE}•${NC} ${WHITE}Uninstall${NC}"
	echo -e "$BLUE│$NC ${BLUE}[00]${NC} ${ORANGE}•${NC} ${RED}Exit${NC}$NC"
	echo -e "$BLUE└─────────────────────────┘${NC}"
	echo -e ""
	echo -ne " Select menu : "
	read opt
	case $opt in
	01 | 1)
		new_auth
		;;
	02 | 2)
		list_auth
		;;
	03 | 3)
		restart_services
		;;
	04 | 4)
		vps_info
		;;
	88 | 8)
		clear
		reboot
		;;
	99 | 9)
		clear
		hys_uninstaller
		exit
		;;
	00 | 0)
		clear
		exit
		;;
	*)
		clear
		menu
		;;
	esac
}
while [[ $? -eq 0 ]]; do
	menu
done
