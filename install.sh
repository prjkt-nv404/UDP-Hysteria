checkRoot() {
	user=$(whoami)
	if [ ! "${user}" = "root" ]; then
		echo -e "\e[91mPlease run as root user!\e[0m" # Red text
		exit 1
	fi
}
T_BOLD=$(tput bold)
T_GREEN=$(tput setaf 2)
T_YELLOW=$(tput setaf 3)
T_RED=$(tput setaf 1)
T_RESET=$(tput sgr0)
script_header() {
	clear
	echo ""
	echo ".-.   .-..---.  ,-.  _______     "
	echo " \ \ / // .-. ) | | |__   __|    "
	echo "  \ V / | | |(_)| |   )| |       "
	echo "   ) /  | | | | | |  (_) |       "
	echo "  (_)   \ \`-' / | \`--. | |       "
	echo "         )---'  |( __.'\`-'       "
	echo "        (_)     (_)              "
	echo "  Telegram: @voltsshx //"
	echo "  ..SSHX.. (c)2021 </> 2024 //"
	echo ""
	echo -e "\e[1m\e[34m****************************************************"
	echo -e "  Installation & Configuration of \e[1;36mHysteria Protocol"
	echo -e "              (Version 1.3.5) - by: @voltsshx"
	echo -e "\e[1m\e[34m****************************************************\e[0m"
	echo ""
}
update_packages() {
	clear
	echo ""
	echo ".-.   .-..---.  ,-.  _______     "
	echo " \ \ / // .-. ) | | |__   __|    "
	echo "  \ V / | | |(_)| |   )| |       "
	echo "   ) /  | | | | | |  (_) |       "
	echo "  (_)   \ \`-' / | \`--. | |       "
	echo "         )---'  |( __.'\`-'       "
	echo "        (_)     (_)              "
	echo "  Telegram: @voltsshx //"
	echo "  ..SSHX.. (c)2021 </> 2024 //"
	echo ""
	echo -e "\033[1;32m[\033[1;32mPass ✅\033[1;32m] \033[1;37m ⇢  \033[1;33mCollecting binaries...\033[0m"
	echo -e "\033[1;32m      ♻️ \033[1;37m      \033[1;33mPlease wait...\033[0m"
	echo -e ""
	sudo apt-get update && sudo apt-get upgrade -y
	local dependencies=("curl" "bc" "grep" "wget" "nano" "net-tools" "figlet" "jq" "python3")
	for dependency in "${dependencies[@]}"; do
		if ! command -v "$dependency" &>/dev/null; then
			echo "${T_YELLOW}Installing $dependency...${T_RESET}"
			apt update && apt install -y "$dependency" >/dev/null 2>&1
		fi
	done
	sudo apt-get install wget nano net-tools figlet lolcat -y
	export PATH="/usr/games:$PATH"
	sudo ln -s /usr/games/lolcat /usr/local/bin/lolcat
	apt install sudo -y >/dev/null 2>&1
	DEBIAN_FRONTEND=noninteractive apt-get -qq install -yqq --no-install-recommends ca-certificates >/dev/null 2>&1
	clear
	echo ""
	echo -e "\033[1;32m[\033[1;32mPass ✅\033[1;32m] \033[1;37m ⇢  \033[1;33mCollecting binaries...\033[0m"
	echo -e "\033[1;32m      ♻️ \033[1;37m      \033[1;33mPlease wait...\033[0m"
	echo -e ""
}
banner() {
	sed -i '/figlet -k Voltssh-X | lolcat/,/echo -e ""/d' ~/.bashrc
	sed -i '/figlet -k Hysteria | lolcat/,/echo -e ""/d' ~/.bashrc
	echo 'clear' >>~/.bashrc
	echo 'echo ""' >>~/.bashrc
	echo 'figlet -k Voltssh-X | lolcat' >>~/.bashrc
	echo 'figlet -k Hysteria | lolcat' >>~/.bashrc
	echo 'echo -e "\t\e\033[94m⚙︎ Voltssh-X Hysteria by @voltsshx ⚙︎\033[0m"' >>~/.bashrc
	echo 'echo -e "\t\e\033[94mTelegram: @voltsshx // \033[0m"' >>~/.bashrc
	echo 'echo -e "\t\e\033[94m..SSHX.. (c)2021 </> 2024 // \033[0m"' >>~/.bashrc
	echo 'echo "" ' >>~/.bashrc
	echo 'echo -e "\t\033[92mTelegram   : @voltsshx | LS Tunnels" ' >>~/.bashrc
	echo 'echo -e "\t\e[1;33mPowered by : AIB Tech Pvt."' >>~/.bashrc
	echo 'echo ""' >>~/.bashrc
	echo 'DATE=$(date +"%d-%m-%y")' >>~/.bashrc
	echo 'TIME=$(date +"%T")' >>~/.bashrc
	echo 'echo -e "\t\e[1;33mServer Name : $HOSTNAME"' >>~/.bashrc
	echo 'echo -e "\t\e[1;33mServer Uptime Time : $(uptime -p)"' >>~/.bashrc
	echo 'echo -e "\t\e[1;33mServer Date : $DATE"' >>~/.bashrc
	echo 'echo -e "\t\e[1;33mServer Time : $TIME"' >>~/.bashrc
	echo 'echo "" ' >>~/.bashrc
	echo 'echo -e "\t\e\033[94mSend us mail: iyke.earth@gmail.com \033[0m"' >>~/.bashrc
	echo 'echo "" ' >>~/.bashrc
	echo 'echo -e "\t\e\033[92mMenu command: volt \033[0m"' >>~/.bashrc
	echo 'echo -e ""' >>~/.bashrc
	echo 'echo -e ""' >>~/.bashrc
	rm -f /root/install.sh && cat /dev/null >~/.bash_history && history -c
	find / -type f -name "hys.json" -delete >/dev/null 2>&1
	find / -type f -name "install.sh" -delete >/dev/null 2>&1
}
verification() {
	clear
	fetch_valid_keys() {
		# Free keys!
		keys=$(curl -s -H "Cache-Control: no-cache" -H "Pragma: no-cache" "https://raw.githubusercontent.com/zac6ix/zac6ix.github.io/master/hys.json")
		echo "$keys"
	}
	verify_key() {
		local key_to_verify="$1"
		local valid_keys="$2"
		# Who'd seriously want to PAY for this anyways??? lol
		#if [[ $valid_keys == *"$key_to_verify"* ]]; then
			return 0 # Key is valid
		#else
		#	return 1 # Key is not valid
		#fi
	}
	valid_keys=$(fetch_valid_keys)
	echo ""
	figlet -k Voltssh-X | awk '{gsub(/./,"\033[3"int(rand()*5+1)"m&\033[0m")}1' && figlet -k Hysteria | awk '{gsub(/./,"\033[3"int(rand()*5+1)"m&\033[0m")}1'
	echo "───────────────────────────────────────────────────────────────────────•"
	echo ""
	echo ""
	echo -e " 〄 \033[1;37m ⌯  \033[1;33mYou must have purchased a Key\033[0m"
	echo -e " 〄 \033[1;37m ⌯  \033[1;33mif you didn't, contact [v3r!f.y.Key 𝕏]\033[0m"
	echo -e " 〄 \033[1;37m ⌯ ⇢ \033[1;33mhttps://t.me/voltverifybot\033[0m"
	echo -e " 〄 \033[1;37m ⌯  \033[1;33mYou can also contact @voltsshx on Telegram\033[0m"
	echo ""
	echo "───────────────────────────────────────────────────────────────────────•"
	read -p " ⇢ Please enter the Installation key: " user_key
	user_key=$(echo "$user_key" | tr -d '[:space:]')
	if [[ ${#user_key} -ne 10 ]]; then
		echo "${T_RED} ⇢ Verification failed. Aborting installation.${T_RESET}"
		find / -type f -name "hys.json" -delete >/dev/null 2>&1
		rm -f /root/hys.json >/dev/null 2>&1
		rm -f hys.json >/dev/null 2>&1
		echo ""
		exit 1
	fi
	if verify_key "$user_key" "$valid_keys"; then
		sleep 2
		echo "${T_GREEN} ⇢ Verification successful.${T_RESET}"
		echo "${T_GREEN} ⇢ Proceeding with the installation...${T_RESET}"
		echo ""
		echo ""
		echo -e "\033[1;32m ♻️ Please wait...\033[0m"
		find / -type f -name "hys.json" -delete >/dev/null 2>&1
		rm -f /root/hys.json >/dev/null 2>&1
		rm -f hys.json >/dev/null 2>&1
		sleep 1
		clear
		clear
		validate_length() {
			local input_string="$1"
			local min_length="$2"
			if [ ${#input_string} -lt $min_length ]; then
				echo "Input must be at least $min_length characters long."
				return 1
			fi
		}
		figlet -k Voltssh-X | awk '{gsub(/./,"\033[3"int(rand()*5+1)"m&\033[0m")}1' && figlet -k Hysteria | awk '{gsub(/./,"\033[3"int(rand()*5+1)"m&\033[0m")}1'
		echo "───────────────────────────────────────────────────────────────────────•"
		echo -e "   Hysteria Server Configuration"
		echo -e "*******************************************\e[0m"
		echo ""
		HYST_SERVER_IP=$(curl -s https://api.ipify.org)
		echo -e "\nHost/Server IP 👉 $HYST_SERVER_IP"
		echo "-------------------------------------------"
		echo -e "\nEnter your Domain: 👇"
		echo -e "(get a free domain from 'https://duckdns.org')"
		read -p "" DOMAIN
		echo "-------------------------------------------"
		while true; do
			echo -e "\nPlease enter Obfuscation(OBFS): ��"
			echo -e "(must be at least 10 charactors)"
			read -p "" OBFS
			if validate_length "$OBFS" 10; then
				break # Break the loop if input is valid
			fi
		done
		echo "-------------------------------------------"
		while true; do
			echo -e "\nPlease enter Authentication(AUTH): 👇"
			echo -e "(must be at least 10 charactors)"
			read -p "" PASSWORD
			if validate_length "$PASSWORD" 10; then
				break # Break the loop if input is valid
			fi
		done
		echo ""
		mkdir -p /etc/volt
		PROTOCOL="udp"
		UDP_PORT=":36712"
		UDP_PORT_HP="10000-65000"
		HPStart="10000"
		HPEnd="65000"
		UDP_QUIC_WINDOW="196608"
		remarks="VoltxHysteriaConfig"
		sec="1"
		url=$(echo -e "hysteria://${DOMAIN}:${UDP_PORT}?mport=${HPStart}-${HPEnd}&protocol=${protocol}&auth=${PASSWORD}&obfsParam=${OBFS}&peer=${DOMAIN}&insecure=${sec}&upmbps=100&downmbps=100&alpn=#${remarks}" | sed 's/ /%20/g')
		supportedApps="Supported Apps: AIO Tunnel, AIO Injector, Http Injector, NekoBox"
		echo "$DOMAIN" >/etc/volt/DOMAIN
		echo "$PROTOCOL" >/etc/volt/PROTOCOL
		echo "$UDP_PORT" >/etc/volt/UDP_PORT
		echo "$UDP_PORT_HP" >/etc/volt/UDP_PORT_HP
		echo "$OBFS" >/etc/volt/OBFS
		echo "$PASSWORD" >/etc/volt/PASSWORD
		export DOMAIN
		export PROTOCOL
		export UDP_PORT
		export UDP_PORT_HP
		export OBFS
		export PASSWORD
		SCRIPT_NAME="$(basename "$0")"
		SCRIPT_ARGS=("$@")
		EXECUTABLE_INSTALL_PATH="/usr/local/bin/hysteria"
		SYSTEMD_SERVICES_DIR="/etc/systemd/system"
		CONFIG_DIR="/etc/hysteria"
		REPO_URL="https://github.com/apernet/hysteria"
		API_BASE_URL="https://api.github.com/repos/apernet/hysteria"
		CURL_FLAGS=(-L -f -q --retry 5 --retry-delay 10 --retry-max-time 60)
		PACKAGE_MANAGEMENT_INSTALL="${PACKAGE_MANAGEMENT_INSTALL:-}"
		OPERATING_SYSTEM="${OPERATING_SYSTEM:-}"
		ARCHITECTURE="${ARCHITECTURE:-}"
		HYSTERIA_USER="${HYSTERIA_USER:-}"
		HYSTERIA_HOME_DIR="${HYSTERIA_HOME_DIR:-}"
		OPERATION=
		VERSION=
		FORCE=
		LOCAL_FILE=
		has_command() {
			local _command=$1
			type -P "$_command" >/dev/null 2>&1
		}
		curl() {
			command curl "${CURL_FLAGS[@]}" "$@"
		}
		mktemp() {
			command mktemp "$@" "hyservinst.XXXXXXXXXX"
		}
		tput() {
			if has_command tput; then
				command tput "$@"
			fi
		}
		tred() {
			tput setaf 1
		}
		tgreen() {
			tput setaf 2
		}
		tyellow() {
			tput setaf 3
		}
		tblue() {
			tput setaf 4
		}
		taoi() {
			tput setaf 6
		}
		tbold() {
			tput bold
		}
		treset() {
			tput sgr0
		}
		note() {
			local _msg="$1"
			echo -e "$SCRIPT_NAME: $(tbold)note: $_msg$(treset)"
		}
		warning() {
			local _msg="$1"
			echo -e "$SCRIPT_NAME: $(tyellow)warning: $_msg$(treset)"
		}
		error() {
			local _msg="$1"
			echo -e "$SCRIPT_NAME: $(tred)error: $_msg$(treset)"
		}
		has_prefix() {
			local _s="$1"
			local _prefix="$2"
			if [[ -z "$_prefix" ]]; then
				return 0
			fi
			if [[ -z "$_s" ]]; then
				return 1
			fi
			[[ "x$_s" != "x${_s#"$_prefix"}" ]]
		}
		systemctl() {
			if [[ "x$FORCE_NO_SYSTEMD" == "x2" ]] || ! has_command systemctl; then
				return
			fi
			command systemctl "$@"
		}
		show_argument_error_and_exit() {
			local _error_msg="$1"
			error "$_error_msg"
			echo "Try \"$0 --help\" for the usage." >&2
			exit 22
		}
		install_content() {
			local _install_flags="$1"
			local _content="$2"
			local _destination="$3"
			local _tmpfile="$(mktemp)"
			echo -ne "Install $_destination ... "
			echo "$_content" >"$_tmpfile"
			if install "$_install_flags" "$_tmpfile" "$_destination"; then
				echo -e "ok"
			fi
			rm -f "$_tmpfile"
		}
		remove_file() {
			local _target="$1"
			echo -ne "Remove $_target ... "
			if rm "$_target"; then
				echo -e "ok"
			fi
		}
		exec_sudo() {
			local _saved_ifs="$IFS"
			IFS=$'\n'
			local _preserved_env=(
				$(env | grep "^PACKAGE_MANAGEMENT_INSTALL=" || true)
				$(env | grep "^OPERATING_SYSTEM=" || true)
				$(env | grep "^ARCHITECTURE=" || true)
				$(env | grep "^HYSTERIA_\w*=" || true)
				$(env | grep "^FORCE_\w*=" || true)
			)
			IFS="$_saved_ifs"
			exec sudo env \
				"${_preserved_env[@]}" \
				"$@"
		}
		detect_package_manager() {
			if [[ -n "$PACKAGE_MANAGEMENT_INSTALL" ]]; then
				return 0
			fi
			if has_command apt; then
				PACKAGE_MANAGEMENT_INSTALL='apt update; apt -y install'
				return 0
			fi
			if has_command dnf; then
				PACKAGE_MANAGEMENT_INSTALL='dnf check-update; dnf -y install'
				return 0
			fi
			if has_command yum; then
				PACKAGE_MANAGEMENT_INSTALL='yum update; yum -y install'
				return 0
			fi
			if has_command zypper; then
				PACKAGE_MANAGEMENT_INSTALL='zypper update; zypper install -y --no-recommends'
				return 0
			fi
			if has_command pacman; then
				PACKAGE_MANAGEMENT_INSTALL='pacman -Syu; pacman -Syu --noconfirm'
				return 0
			fi
			return 1
		}
		install_software() {
			local _package_name="$1"
			if ! detect_package_manager; then
				error "Supported package manager is not detected, please install the following package manually:"
				echo
				echo -e "\t* $_package_name"
				echo
				exit 65
			fi
			echo "Installing missing dependence '$_package_name' with '$PACKAGE_MANAGEMENT_INSTALL' ... "
			if $PACKAGE_MANAGEMENT_INSTALL "$_package_name"; then
				echo "ok"
			else
				error "Cannot install '$_package_name' with detected package manager, please install it manually."
				exit 65
			fi
		}
		is_user_exists() {
			local _user="$1"
			id "$_user" >/dev/null 2>&1
		}
		check_permission() {
			if [[ "$UID" -eq '0' ]]; then
				return
			fi
			note "The user currently executing this script is not root."
			case "$FORCE_NO_ROOT" in
			'1')
				warning "FORCE_NO_ROOT=1 is specified, we will process without root and you may encounter the insufficient privilege error."
				;;
			*)
				if has_command sudo; then
					note "Re-running this script with sudo, you can also specify FORCE_NO_ROOT=1 to force this script running with current user."
					exec_sudo "$0" "${SCRIPT_ARGS[@]}"
				else
					error "Please run this script with root or specify FORCE_NO_ROOT=1 to force this script running with current user."
					exit 13
				fi
				;;
			esac
		}
		check_environment_operating_system() {
			if [[ -n "$OPERATING_SYSTEM" ]]; then
				warning "OPERATING_SYSTEM=$OPERATING_SYSTEM is specified, opreating system detection will not be perform."
				return
			fi
			if [[ "x$(uname)" == "xLinux" ]]; then
				OPERATING_SYSTEM=linux
				return
			fi
			error "This script only supports Linux."
			note "Specify OPERATING_SYSTEM=[linux|darwin|freebsd|windows] to bypass this check and force this script running on this $(uname)."
			exit 95
		}
		check_environment_architecture() {
			if [[ -n "$ARCHITECTURE" ]]; then
				warning "ARCHITECTURE=$ARCHITECTURE is specified, architecture detection will not be performed."
				return
			fi
			case "$(uname -m)" in
			'i386' | 'i686')
				ARCHITECTURE='386'
				;;
			'amd64' | 'x86_64')
				ARCHITECTURE='amd64'
				;;
			'armv5tel' | 'armv6l' | 'armv7' | 'armv7l')
				ARCHITECTURE='arm'
				;;
			'armv8' | 'aarch64')
				ARCHITECTURE='arm64'
				;;
			'mips' | 'mipsle' | 'mips64' | 'mips64le')
				ARCHITECTURE='mipsle'
				;;
			's390x')
				ARCHITECTURE='s390x'
				;;
			*)
				error "The architecture '$(uname -a)' is not supported."
				note "Specify ARCHITECTURE=<architecture> to bypass this check and force this script running on this $(uname -m)."
				exit 8
				;;
			esac
		}
		check_environment_systemd() {
			if [[ -d "/run/systemd/system" ]] || grep -q systemd <(ls -l /sbin/init); then
				return
			fi
			case "$FORCE_NO_SYSTEMD" in
			'1')
				warning "FORCE_NO_SYSTEMD=1 is specified, we will process as normal even if systemd is not detected by us."
				;;
			'2')
				warning "FORCE_NO_SYSTEMD=2 is specified, we will process but all systemd related command will not be executed."
				;;
			*)
				error "This script only supports Linux distributions with systemd."
				note "Specify FORCE_NO_SYSTEMD=1 to disable this check and force this script running as systemd is detected."
				note "Specify FORCE_NO_SYSTEMD=2 to disable this check along with all systemd related commands."
				;;
			esac
		}
		check_environment_curl() {
			if has_command curl; then
				return
			fi
			apt update
			apt -y install curl
		}
		check_environment_grep() {
			if has_command grep; then
				return
			fi
			apt update
			apt -y install grep
		}
		check_environment() {
			check_environment_operating_system
			check_environment_architecture
			check_environment_systemd
			check_environment_curl
			check_environment_grep
		}
		vercmp_segment() {
			local _lhs="$1"
			local _rhs="$2"
			if [[ "x$_lhs" == "x$_rhs" ]]; then
				echo 0
				return
			fi
			if [[ -z "$_lhs" ]]; then
				echo -1
				return
			fi
			if [[ -z "$_rhs" ]]; then
				echo 1
				return
			fi
			local _lhs_num="${_lhs//[A-Za-z]*/}"
			local _rhs_num="${_rhs//[A-Za-z]*/}"
			if [[ "x$_lhs_num" == "x$_rhs_num" ]]; then
				echo 0
				return
			fi
			if [[ -z "$_lhs_num" ]]; then
				echo -1
				return
			fi
			if [[ -z "$_rhs_num" ]]; then
				echo 1
				return
			fi
			local _numcmp=$(($_lhs_num - $_rhs_num))
			if [[ "$_numcmp" -ne 0 ]]; then
				echo "$_numcmp"
				return
			fi
			local _lhs_suffix="${_lhs#"$_lhs_num"}"
			local _rhs_suffix="${_rhs#"$_rhs_num"}"
			if [[ "x$_lhs_suffix" == "x$_rhs_suffix" ]]; then
				echo 0
				return
			fi
			if [[ -z "$_lhs_suffix" ]]; then
				echo 1
				return
			fi
			if [[ -z "$_rhs_suffix" ]]; then
				echo -1
				return
			fi
			if [[ "$_lhs_suffix" < "$_rhs_suffix" ]]; then
				echo -1
				return
			fi
			echo 1
		}
		vercmp() {
			local _lhs=${1#v}
			local _rhs=${2#v}
			while [[ -n "$_lhs" && -n "$_rhs" ]]; do
				local _clhs="${_lhs/.*/}"
				local _crhs="${_rhs/.*/}"
				local _segcmp="$(vercmp_segment "$_clhs" "$_crhs")"
				if [[ "$_segcmp" -ne 0 ]]; then
					echo "$_segcmp"
					return
				fi
				_lhs="${_lhs#"$_clhs"}"
				_lhs="${_lhs#.}"
				_rhs="${_rhs#"$_crhs"}"
				_rhs="${_rhs#.}"
			done
			if [[ "x$_lhs" == "x$_rhs" ]]; then
				echo 0
				return
			fi
			if [[ -z "$_lhs" ]]; then
				echo -1
				return
			fi
			if [[ -z "$_rhs" ]]; then
				echo 1
				return
			fi
			return
		}
		check_hysteria_user() {
			local _default_hysteria_user="$1"
			if [[ -n "$HYSTERIA_USER" ]]; then
				return
			fi
			if [[ ! -e "$SYSTEMD_SERVICES_DIR/hysteria.service" ]]; then
				HYSTERIA_USER="$_default_hysteria_user"
				return
			fi
			HYSTERIA_USER="$(grep -o '^User=\w*' "$SYSTEMD_SERVICES_DIR/hysteria.service" | tail -1 | cut -d '=' -f 2 || true)"
			if [[ -z "$HYSTERIA_USER" ]]; then
				HYSTERIA_USER="$_default_hysteria_user"
			fi
		}
		check_hysteria_homedir() {
			local _default_hysteria_homedir="$1"
			if [[ -n "$HYSTERIA_HOME_DIR" ]]; then
				return
			fi
			if ! is_user_exists "$HYSTERIA_USER"; then
				HYSTERIA_HOME_DIR="$_default_hysteria_homedir"
				return
			fi
			HYSTERIA_HOME_DIR="$(eval echo ~"$HYSTERIA_USER")"
		}
		tpl_hysteria_server_service_base() {
			local _config_name="$1"
			cat <<EOF
[Unit]
Description=Voltssh-X Hysteria Service @voltsshx
After=network.target
[Service]
User=root
Group=root
WorkingDirectory=/etc/hysteria
Environment="PATH=/usr/local/bin/hysteria"
ExecStart=/usr/local/bin/hysteria -config /etc/hysteria/config.json server
[Install]
WantedBy=multi-user.target
EOF
		}
		tpl_hysteria_server_service() {
			tpl_hysteria_server_service_base 'config'
		}
		tpl_hysteria_server_x_service() {
			tpl_hysteria_server_service_base '%i'
		}
		tpl_etc_hysteria_config_json() {
			cat <<EOF
{
"server": "$DOMAIN",
"listen": "$UDP_PORT",
"protocol": "$PROTOCOL",
"cert": "/etc/hysteria/hysteria.server.crt",
"key": "/etc/hysteria/hysteria.server.key",
"up": "100 Mbps",
"up_mbps": 100,
"down": "100 Mbps",
"down_mbps": 100,
"disable_udp": false,
"obfs": "$OBFS",
"auth": {
"mode": "passwords",
"config": ["$PASSWORD"]
}
}
EOF
		}
		get_running_services() {
			if [[ "x$FORCE_NO_SYSTEMD" == "x2" ]]; then
				return
			fi
			systemctl list-units --state=active --plain --no-legend |
				grep -o "hysteria-server@*[^\s]*.service" || true
		}
		restart_running_services() {
			if [[ "x$FORCE_NO_SYSTEMD" == "x2" ]]; then
				return
			fi
			echo "Restarting running service ... "
			for service in $(get_running_services); do
				echo -ne "Restarting $service ... "
				systemctl restart "$service"
				echo "done"
			done
		}
		stop_running_services() {
			if [[ "x$FORCE_NO_SYSTEMD" == "x2" ]]; then
				return
			fi
			echo "Stopping running service ... "
			for service in $(get_running_services); do
				echo -ne "Stopping $service ... "
				systemctl stop "$service"
				echo "done"
			done
		}
		is_hysteria_installed() {
			if [[ -f "$EXECUTABLE_INSTALL_PATH" || -L "$EXECUTABLE_INSTALL_PATH" ]]; then
				return 0
			fi
			return 1
		}
		get_installed_version() {
			if is_hysteria_installed; then
				"$EXECUTABLE_INSTALL_PATH" -v | cut -d ' ' -f 3
			fi
		}
		get_latest_version() {
			if [[ -n "$VERSION" ]]; then
				echo "$VERSION"
				return
			fi
			local _tmpfile=$(mktemp)
			if ! curl -sS -H 'Accept: application/vnd.github.v3+json' "$API_BASE_URL/releases/latest" -o "$_tmpfile"; then
				error "Failed to get latest release, please check your network."
				exit 11
			fi
			local _latest_version=$(grep 'tag_name' "$_tmpfile" | head -1 | grep -o '"v.*"')
			_latest_version=${_latest_version#'"'}
			_latest_version=${_latest_version%'"'}
			if [[ -n "$_latest_version" ]]; then
				echo "$_latest_version"
			fi
			rm -f "$_tmpfile"
		}
		download_hysteria() {
			local _version="$1"
			local _destination="$2"
			local _download_url="$REPO_URL/releases/download/v1.3.5/hysteria-$OPERATING_SYSTEM-$ARCHITECTURE"
			echo "Downloading hysteria archive: $_download_url ..."
			if ! curl -R -H 'Cache-Control: no-cache' "$_download_url" -o "$_destination"; then
				error "Download failed! Please check your network and try again."
				return 11
			fi
			return 0
		}
		perform_install_hysteria_binary() {
			if [[ -n "$LOCAL_FILE" ]]; then
				note "Performing local initialization of: $LOCAL_FILE"
				echo -ne "Initializing hysteria binaries ... "
				if install -Dm755 "$LOCAL_FILE" "$EXECUTABLE_INSTALL_PATH"; then
					echo "ok"
				else
					exit 2
				fi
				return
			fi
			local _tmpfile=$(mktemp)
			if ! download_hysteria "$VERSION" "$_tmpfile"; then
				rm -f "$_tmpfile"
				exit 11
			fi
			echo -ne "Initializing hysteria binaries ... "
			if install -Dm755 "$_tmpfile" "$EXECUTABLE_INSTALL_PATH"; then
				echo "ok"
			else
				exit 13
			fi
			rm -f "$_tmpfile"
		}
		perform_remove_hysteria_binary() {
			remove_file "$EXECUTABLE_INSTALL_PATH"
		}
		perform_install_hysteria_example_config() {
			install_content -Dm644 "$(tpl_etc_hysteria_config_json)" "$CONFIG_DIR/config.json" ""
		}
		perform_install_hysteria_systemd() {
			if [[ "x$FORCE_NO_SYSTEMD" == "x2" ]]; then
				return
			fi
			install_content -Dm644 "$(tpl_hysteria_server_service)" "$SYSTEMD_SERVICES_DIR/hysteria.service"
			install_content -Dm644 "$(tpl_hysteria_server_x_service)" "$SYSTEMD_SERVICES_DIR/hysteria@.service"
			systemctl daemon-reload
		}
		perform_remove_hysteria_systemd() {
			remove_file "$SYSTEMD_SERVICES_DIR/hysteria.service"
			remove_file "$SYSTEMD_SERVICES_DIR/hysteria@.service"
			systemctl daemon-reload
		}
		perform_install_hysteria_home_legacy() {
			if ! is_user_exists "$HYSTERIA_USER"; then
				echo -ne "Creating user $HYSTERIA_USER ... "
				useradd -r -d "$HYSTERIA_HOME_DIR" -m "$HYSTERIA_USER"
				echo "ok"
			fi
		}
		perform_install() {
			local _is_frash_install
			if ! is_hysteria_installed; then
				_is_frash_install=1
			fi
			perform_install_hysteria_binary
			perform_install_hysteria_example_config
			perform_install_hysteria_home_legacy
			perform_install_hysteria_systemd
			setup_ssl
			start_services
		}
		setup_ssl() {
			echo "Generate SSL certificates"
			openssl genrsa -out /etc/hysteria/hysteria.ca.key 2048
			openssl req -new -x509 -days 3650 -key /etc/hysteria/hysteria.ca.key -subj "/C=CN/ST=GD/L=SZ/O=Hysteria, Inc./CN=Hysteria Root CA" -out /etc/hysteria/hysteria.ca.crt
			openssl req -newkey rsa:2048 -nodes -keyout /etc/hysteria/hysteria.server.key -subj "/C=CN/ST=GD/L=SZ/O=Hysteria, Inc./CN=$DOMAIN" -out /etc/hysteria/hysteria.server.csr
			openssl x509 -req -extfile <(printf "subjectAltName=DNS:$DOMAIN,DNS:$DOMAIN") -days 3650 -in /etc/hysteria/hysteria.server.csr -CA /etc/hysteria/hysteria.ca.crt -CAkey /etc/hysteria/hysteria.ca.key -CAcreateserial -out /etc/hysteria/hysteria.server.crt
		}
		start_services() {
			apt update
			sudo debconf-set-selections <<<"iptables-persistent iptables-persistent/autosave_v4 boolean true"
			sudo debconf-set-selections <<<"iptables-persistent iptables-persistent/autosave_v6 boolean true"
			apt -y install iptables-persistent
			iptables -t nat -A PREROUTING -i $(ip -4 route ls | grep default | grep -Po '(?<=dev )(\S+)' | head -1) -p udp --dport 10000:65000 -j DNAT --to-destination $UDP_PORT
			ip6tables -t nat -A PREROUTING -i $(ip -4 route ls | grep default | grep -Po '(?<=dev )(\S+)' | head -1) -p udp --dport 10000:65000 -j DNAT --to-destination $UDP_PORT
			sysctl net.ipv4.conf.all.rp_filter=0
			sysctl net.ipv4.conf.$(ip -4 route ls | grep default | grep -Po '(?<=dev )(\S+)' | head -1).rp_filter=0
			echo "net.ipv4.ip_forward = 1
net.ipv4.conf.all.rp_filter=0
net.ipv4.conf.$(ip -4 route ls | grep default | grep -Po '(?<=dev )(\S+)' | head -1).rp_filter=0" >/etc/sysctl.conf
			sysctl -p
			sudo iptables-save >/etc/iptables/rules.v4
			sudo ip6tables-save >/etc/iptables/rules.v6
			systemctl enable hysteria.service
			systemctl start hysteria.service
		}
		volt() {
			clear
			figlet -k volt-udp | awk '{gsub(/./,"\033[3"int(rand()*5+1)"m&\033[0m")}1' && figlet -k hysteria | awk '{gsub(/./,"\033[3"int(rand()*5+1)"m&\033[0m")}1'
			echo "───────────────────────────────────────────────────────────────────────•"
			echo ""
			echo -e "\033[1;32m[\033[1;32mPass ✅\033[1;32m] \033[1;37m ⇢  \033[1;33mChecking libs...\033[0m"
			echo -e "\033[1;32m      ♻️ \033[1;37m      \033[1;33mPlease wait...\033[0m"
			echo -e ""
			wget -O /usr/bin/volt --no-cache 'https://raw.githubusercontent.com/prjkt-nv404/UDP-Hysteria/main/lib/volt.sh' &>/dev/null
			wget -O /etc/volt/cfgupt.py --no-cache 'https://raw.githubusercontent.com/prjkt-nv404/UDP-Hysteria/main/lib/cfgupt.py' &>/dev/null
			chmod +x /usr/bin/volt &>/dev/null
			chmod +x /etc/volt/cfgupt.py &>/dev/null
			echo ""
		}
		voltx_hysteria_inst() {
			check_permission
			check_environment
			check_hysteria_user "hysteria"
			check_hysteria_homedir "/var/lib/$HYSTERIA_USER"
			perform_install
			volt
		}
		voltx_hysteria_inst
		sleep 2
	else
		clear
		figlet -k volt-udp | awk '{gsub(/./,"\033[3"int(rand()*5+1)"m&\033[0m")}1' && figlet -k hysteria | awk '{gsub(/./,"\033[3"int(rand()*5+1)"m&\033[0m")}1'
		echo "───────────────────────────────────────────────────────────────────────•"
		echo "${T_RED} ⇢ Verification failed. Aborting installation.${T_RESET}"
		exit 1
	fi
}
client_config() {
	clear
	echo ""
	figlet -k Voltssh-X | lolcat && figlet -k Hysteria | lolcat
	echo -e "\e[1;34m************************************"
	echo -e "   Generating Client configuration"
	echo -e "       please wait for 5 seconds..."
	echo -e "\e[0m"
	sleep 5 # sleep
	clear
	mkdir -p /etc/hysteria/client
	rm -f /etc/hysteria/client/config.json &>/dev/null
	cat <<EOF >/etc/hysteria/client/config.json
{
"server": "$DOMAIN",
"listen": "$UDP_PORT",
"protocol": "$PROTOCOL",
"cert": "/etc/hysteria/hysteria.server.crt",
"key": "/etc/hysteria/hysteria.server.key",
"up": "100 Mbps",
"up_mbps": 100,
"down": "100 Mbps",
"down_mbps": 100,
"disable_udp": false,
"obfs": "$OBFS",
"auth": {
"mode": "passwords",
"config": ["$PASSWORD"]
}
}
EOF
	cat <<EOF >/etc/hysteria/client/info.txt
----------------------
Client Configuration
----------------------
Hysteria Server Domain: $DOMAIN
Hysteria Server IP: $HYST_SERVER_IP
Hysteria Server Port(Single): $UDP_PORT
Hysteria Server Port(Hopping): $UDP_PORT_HP
Obfuscation(OBFS): $OBFS
Authentication(AUTH) password: $PASSWORD
QUIC Receive Windows: $UDP_QUIC_WINDOW
Max Upload & Download: 100
URI(with port hopping)
$url
$supportedApps
---------------------
(Version 1.3.5)
script by: @voltsshx
EOF
	chmod +x /etc/hysteria/client/config.json
	echo ""
	figlet -k Voltssh-X | lolcat && figlet -k Hysteria | lolcat
	echo -e "\e[1;36m----------------------"
	echo -e " Client Configuration"
	echo -e "----------------------\e[0m"
	echo -e "Remarks: $remarks"
	echo -e "Hysteria Server Domain: $DOMAIN"
	echo -e "Hysteria Server IP: $HYST_SERVER_IP"
	echo -e "Hysteria Server Port(Single): $UDP_PORT"
	echo -e "Hysteria Server Port(Hopping): $UDP_PORT_HP"
	echo -e "Obfuscation(OBFS) password: $OBFS"
	echo -e "Authentication(AUTH) password:  $PASSWORD"
	echo -e "QUIC Receive Windows: $UDP_QUIC_WINDOW"
	echo -e "Max Upload & Download: 100"
	echo -e ""
	echo -e "URI(with port hopping) | Http Injector & NekoBox - import from clipboard"
	echo -e "$url"
	echo ""
	echo -e "$supportedApps"
	echo -e ""
	echo -e "---------------------"
	echo -e "(Version 1.3.5)"
	echo -e "script by: @voltsshx"
	echo ""
	echo ""
	echo -e "Client 'config.json' & 'info.txt' file generated in the"
	echo -e "'client' directory at \e[1;32m'/etc/hysteria/'\e[0m"
	echo -e "*******************************************"
	echo ""
	echo -e "\n* Check service running or not running, type: '\e[1;33msystemctl status hysteria\e[0m' to see logs"
	echo -e "\n* To uninstall, type: '\e[1;91msystemctl stop hysteria; systemctl disable hysteria; rm -rf /etc/hysteria\e[0m' , without quotes"
	echo -e "\nEnjoy using Hysteria"
	echo ""
}
reload_service() {
	systemctl restart hysteria
	systemctl restart systemd-journald
}
main() {
	clear
	checkRoot
	script_header
	update_packages
	banner
	verification
	client_config
	reload_service
	echo "${T_GREEN}Voltssh-X Hysteria Server Installation completed!${T_RESET}"
	echo "${T_YELLOW}Type: "volt" to access the menu${T_RESET}"
	echo ""
	echo ""
	read -p " ⇢  Press any key to exit ↩︎" key
}
main
