# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# --- Sources ------------------------------------------------------------------

# Helper: source a file only if it exists and is readable; warn otherwise.
# Usage: _safe_source <file> [--required]
function _safe_source() {
	local file="$1"
	local required="${2:-}"

	if [[ -r "$file" ]]; then
		source "$file"
	elif [[ "$required" == "--required" ]]; then
		print -P "%F{yellow}[zshrc] WARNING: required file not found: $file%f" >&2
	fi
}

# cachyos-config.zsh
_safe_source /usr/share/cachyos-zsh-config/cachyos-config.zsh

_safe_source "$HOME/.profile"
_safe_source "$HOME/.fzf.zsh"

# Powerlevel10k theme (required)
_safe_source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme --required

# Fish-like syntax highlighting and autosuggestions (required)
_safe_source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh --required
_safe_source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh --required

# History substring search (required)
_safe_source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh --required

# pkgfile "command not found" handler
_safe_source /usr/share/doc/pkgfile/command-not-found.zsh

# To swap `sudo` at the beginning of the command by pressing `<Esc>` twice
_safe_source /usr/share/zsh/plugins/zsh-sudo/sudo.plugin.zsh --required

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
_safe_source "$HOME/.p10k.zsh"

# --- Exports ------------------------------------------------------------------

# Validate FZF_BASE directory exists before exporting
if [[ -d /usr/share/fzf ]]; then
	export FZF_BASE=/usr/share/fzf
else
	print -P "%F{yellow}[zshrc] WARNING: FZF_BASE directory not found: /usr/share/fzf%f" >&2
fi

# --- Zsh config ---------------------------------------------------------------

setopt histignorealldups sharehistory

# Ignore commands that start with spaces and duplicates.
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_EXPIRE_DUPS_FIRST

# Filter specific commands from history.
zshaddhistory() {
	local cmd="${1%%$'\n'}"
	[[ "$cmd" =~ ^([[:space:]]*(bg|fg|c|clear|history|exit|q|pwd|.*\ --help))$ ]] && return 1
	return 0
}

# Keep 50000 lines of history within the shell and save 10000 to ~/.zsh_history.
HISTSIZE=50000
SAVEHIST=10000
HISTFILE=$HOME/.zsh_history

# --- Keybinds -----------------------------------------------------------------

# Use emacs keybindings
bindkey -e

bindkey "^[[H"    beginning-of-line # Home
bindkey "^[[F"    end-of-line       # End
bindkey "^[[3~"   delete-char       # Delete
bindkey "^[[1;3C" forward-word      # Alt + Right-arrow
bindkey "^[[1;3D" backward-word     # Alt + Left-arrow

# --- Aliases ------------------------------------------------------------------

# lsd: ls deluxe
if command -v lsd &>/dev/null; then
	alias l='lsd --group-dirs=first'
	alias la='lsd -A --group-dirs=first'
	alias ll='lsd -lh --group-dirs=first'
	alias lla='lsd -lha --group-dirs=first'
	alias ls='lsd --group-dirs=first'
# fall back to ls
else
    alias ls='ls --color=auto'
    alias l='ls -CF'
    alias la='ls -A'
    alias ll='ls -lh'
    alias lla='ls -lah'
fi

# Aliasing `run-help` to `help`
# `run-help` is Zsh's equivalent of Bash's `help` command.

# Load run-help
autoload -Uz run-help

# Load run-help optional extensions
for helper in \
	run-help-btrfs \
	run-help-docker \
	run-help-git \
	run-help-ip \
	run-help-openssl \
	run-help-ssh \
	run-help-sudo
do
	(( $+functions[$helper] )) || autoload -Uz $helper
done

# Remove the default alias (often points to `man`)
(( ${+aliases[run-help]} )) && unalias run-help

alias help=run-help

# --- Functions ----------------------------------------------------------------

# Create default CTF working directories; optionally pass custom dir names
function mkt() {
	mkdir -p "${@:-nmap content exploits scripts}"
}

# Extract open ports and IP address from an nmap output file
function extractPorts() {
	# Validate argument
	if [[ $# -ne 1 ]]; then
		echo "Usage: extractPorts <nmap-output-file>" >&2
		return 1
	fi

	# Validate input file exists and is readable
	if [[ ! -f "$1" ]]; then
		echo "[!] File not found: $1" >&2
		return 1
	fi
	if [[ ! -r "$1" ]]; then
		echo "[!] File is not readable: $1" >&2
		return 1
	fi

	# Validate required commands are available
	local missing=()
	for cmd in grep awk xargs tr; do
		command -v "$cmd" &>/dev/null || missing+=("$cmd")
	done
	if (( ${#missing[@]} )); then
		echo "[!] Missing required commands: ${missing[*]}" >&2
		return 1
	fi

	local ports ip_address

	# Extract comma-separated open ports
	ports="$(grep -oP "\d{1,5}/open" "$1" | awk -F'/' '{print $1}' | xargs | tr ' ' ',')"

	# Extract the target IP address
	ip_address="$(grep -oP "\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}" "$1" | sort -u | head -n 1)"

	# Warn if nothing was extracted
	if [[ -z "$ports" ]]; then
		echo "[!] No open ports found in $1" >&2
		return 1
	fi
	if [[ -z "$ip_address" ]]; then
		echo "[!] No IP address found in $1" >&2
	fi

	{
		echo -e "\n[*] Extracting information...\n"
		echo -e "\t[*] IP Address: $ip_address"
		echo -e "\t[*] Open ports: $ports\n"
		echo -e "[*] Ports copied to clipboard\n"
	} > extractPorts.tmp

	# Copy ports to clipboard; support both X11 (xclip) and Wayland (wl-copy)
	if command -v xclip &>/dev/null; then
		echo "$ports" | tr -d '\n' | xclip -sel clip
	elif command -v wl-copy &>/dev/null; then
		echo "$ports" | tr -d '\n' | wl-copy
	else
		echo "[!] No clipboard utility found (install xclip or wl-clipboard)" >&2
	fi

	cat extractPorts.tmp
	rm -f extractPorts.tmp
}

# Enhanced fzf file preview
# Usage: fzf-lovely              -- vertical preview (default)
#        fzf-lovely --horizontal -- horizontal/bottom preview pane
function fzf-lovely() {
	# Validate fzf is available
	if ! command -v fzf &>/dev/null; then
		echo "[!] fzf is not installed" >&2
		return 1
	fi

	# Validate flag if provided
	if [[ -n "$1" && "$1" != "-h" && "$1" != "--horizontal" ]]; then
		echo "Usage: fzf-lovely [-h|--horizontal]" >&2
		return 1
	fi

	local preview_cmd="[[ \$(file --mime {}) =~ binary ]] &&
		echo {} is a binary file ||
		(bat --style=numbers --color=always {} ||
		highlight -O ansi -l {} ||
		coderay {} ||
		rougify {} ||
		cat {}) 2> /dev/null | head -500"

	if [[ "$1" == "-h" || "$1" == "--horizontal" ]]; then
		fzf -m --reverse --preview-window down:20 --preview "$preview_cmd"
	else
		fzf -m --preview "$preview_cmd"
	fi
}
