# Create directories
function mkt() {
	mkdir -p nmap content exploits scripts
}

# Extract Nmap information
function extractPorts() {
	local ports ip_address
	# Extract ports and IP addresses safely
	ports="$(grep -oP "\\d{1,5}/open" "$1" | awk -F'/' '{print $1}' | xargs | tr ' ' ',')"
	ip_address="$(grep -oP "\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}" "$1" | sort -u | head -n 1)"

	{
		echo -e "\n[*] Extracting information...\n"
		echo -e "\t[*] IP Address: $ip_address"
		echo -e "\t[*] Open ports: $ports\n"
		echo -e "[*] Ports copied to clipboard\n"
	} >extractPorts.tmp

	echo "$ports" | tr -d '\n' | xclip -sel clip
	cat extractPorts.tmp
	rm -f extractPorts.tmp
}

# Set 'man' colors
function man() {
	env \
		LESS_TERMCAP_mb=$'\e[01;31m' \
		LESS_TERMCAP_md=$'\e[01;31m' \
		LESS_TERMCAP_me=$'\e[0m' \
		LESS_TERMCAP_se=$'\e[0m' \
		LESS_TERMCAP_so=$'\e[01;44;33m' \
		LESS_TERMCAP_ue=$'\e[0m' \
		LESS_TERMCAP_us=$'\e[01;32m' \
		man "$@"
}

# Enhanced fzf function
function fzf-lovely() {
	if [[ "$1" == "h" ]]; then
		fzf -m --reverse --preview-window down:20 --preview \
			"[[ \$(file --mime {}) =~ binary ]] &&
			echo {} is a binary file ||
			(bat --style=numbers --color=always {} ||
			highlight -O ansi -l {} ||
			coderay {} ||
			rougify {} ||
			cat {}) 2> /dev/null | head -500"
	else
		fzf -m --preview \
			"[[ \$(file --mime {}) =~ binary ]] &&
			echo {} is a binary file ||
			(bat --style=numbers --color=always {} ||
			highlight -O ansi -l {} ||
			coderay {} ||
			rougify {} ||
			cat {}) 2> /dev/null | head -500"
	fi
}

# Secure file deletion
function rmk() {
	local file="$1"
	if [[ -f "$file" ]]; then
		scrub -p dod "$file"
		shred -zun 10 -v "$file"
	else
		echo "File not found: $file"
	fi
}
