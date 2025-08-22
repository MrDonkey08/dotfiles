# Create directories
function mkt()
{
	mkdir -p nmap content exploits scripts
}

# Extract Nmap information
function extractPorts()
{
	local ports ip_address
	# Extract ports and IP addresses safely
	ports="$(grep -oP "\\d{1,5}/open" "$1" | awk -F'/' '{print $1}' | xargs | tr ' ' ',')"
	ip_address="$(grep -oP "\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}" "$1" | sort -u | head -n 1)"

	{
		echo -e "\n[*] Extracting information...\n"
		echo -e "\t[*] IP Address: $ip_address"
		echo -e "\t[*] Open ports: $ports\n"
		echo -e "[*] Ports copied to clipboard\n"
	} > extractPorts.tmp

	echo "$ports" | tr -d '\n' | xclip -sel clip
	cat extractPorts.tmp
	rm -f extractPorts.tmp
}

# Enhanced fzf function
function fzf-lovely()
{
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
