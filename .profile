#
# ~/.profile
#

# --- Sources ------------------------------------------------------------------

[[ -s "$HOME/.cargo/env" ]] && \. "$HOME/.cargo/env"

# --- Exports -----------------------------------------------------------------

# Append "$1" to $PATH when not already in.
function append_path() {
	case ":$PATH:" in
	*:"$1":*) ;;
	*)
		PATH="${PATH:+$PATH:}$1"
		;;
	esac
}

## PATH
append_path "$HOME/Apps"
append_path "$HOME/bin"
append_path "$HOME/.yarn/bin"

## Editor
export EDITOR='nvim'
export VISUAL='nvim'

## Pager
# export LESS='-R'
export PAGER='less'
export MDCAT_PAGER='less -RF'
export BAT_PAGER='less -RF'
# export MANPAGER='less -R --use-color -Dd+r -Du+c -Du+ '
export MANROFFOPT="-c"

## Performance
# To enable Vulkan Video support in vulkan-intel. This can improve battery life
export ANV_DEBUG="video-decode,video-encode"

## SOFTWARE
GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export GEM_HOME

## CUSTOM
export TRASH="$HOME/.local/share/Trash"

# --- Aliases ------------------------------------------------------------------

# cat
alias bat='bat --color=always'

# dates
alias iso_date='date +"%Y-%m-%d"'
alias us_date='iso_date'
alias cdate='iso_date'
alias mxn_date='date +"%d-%m-%Y"'

# alias to get tempeature of the cpu cores
alias core-temp='sensors | grep Core'
alias sensors-json='sensors -j 2> /dev/null | prettier --parser json | bat --language json'

# comands/alias to get public ip
# alias pub-ip='curl https://ipinfo.io/ip'
alias pub-ip='curl ifconfig.me'
alias pub-ipv4='curl -4 ifconfig.me'
alias pub-ipv6='curl -6 ifconfig.me'
alias pub-ip-json='curl -4 ipinfo.io/json'
alias pub-ipv4-json='curl -4 ipinfo.io/json'
alias pub-ipv6-json='curl -6 ipinfo.io/json'

# GUI apps aliases
alias filen='setsid filen &> /dev/null &'
alias session='setsid session &> /dev/null &'
alias onlyoffice='setsid onlyoffice &> /dev/null &'
alias standard-notes='setsid standard-notes &> /dev/null &'

# grep
alias grep='grep --color=auto'
alias egrep='grep -E --color=auto'
alias fgrep='grep -F --color=auto'
alias grepp='grep -P --color=auto'

alias diff='diff --color=auto'
alias ip='ip --color=auto'

# Git
alias gitclean="find . -type d -name '.git' -execdir git clean -dfx \;"

# --- Functions ----------------------------------------------------------------

# Set code colors
man() {
	env \
		MANWIDTH="$(tput cols)" \
		LESS_TERMCAP_mb=$'\e[01;31m' \
		LESS_TERMCAP_md=$'\e[01;31m' \
		LESS_TERMCAP_me=$'\e[0m' \
		LESS_TERMCAP_se=$'\e[0m' \
		LESS_TERMCAP_so=$'\e[01;44;33m' \
		LESS_TERMCAP_ue=$'\e[0m' \
		LESS_TERMCAP_us=$'\e[01;32m' \
		man "$@"
}

icat() {
	if [ "$TERM" = "xterm-kitty" ]; then
		kitty +kitten icat "$@"
	elif [ "$TERM_PROGRAM" = "WezTerm" ]; then
		wezterm imgcat "$@"
	elif command -v viu >/dev/null 2>&1; then
		viu "$@"
	elif command -v chafa >/dev/null 2>&1; then
		chafa "$@"
	elif command -v display >/dev/null 2>&1; then
		display "$@"
	else
		printf '%s\n' "No supported image viewer found for $TERM"
		return 1
	fi
}

# Secure file deletion
rmk() {
	local file="$1"
	if [ -f "$file" ]; then
		scrub -p dod "$file"
		shred -zun 10 -v "$file"
	else
		echo "File not found: $file"
	fi
}

bhelp() {
	if [ $# -eq 1 ]; then
		bash -c "help $1"
	else
		echo "Error: One argument required"
	fi
}

# Image conversion
img_convert() {
	if [ $# -lt 3 ]; then
		echo "Usage: img_convert <images> <output_extension> <quality>"
		return 1
	fi

	local imgs=("${@:1:$#-2}")
	local out_ext=("${@: -2:1}")
	local quality=("${@: -1}")

	for img in "${imgs[@]}"; do
		if [ -f "$img" ]; then
			magick "$img" -quality "$quality" "${img%.*}.$out_ext"
		else
			echo "Warning: File not found - $img"
		fi
	done
}

# Image resizing
img_resize() {
	if [ $# -lt 4 ]; then
		echo "Usage: img_resize <images> <width> <height> <quality>"
		return 1
	fi

	local imgs=("${@:1:$#-3}")
	local width=("${@: -3:1}")
	local height=("${@: -2:1}")
	local quality=("${@: -1}")

	for img in "${imgs[@]}"; do
		if [ -f "$img" ]; then
			magick "$img" -quality "$quality" -resize "${width}x${height}>" "$img"
		else
			echo "Warning: File not found - $img"
		fi
	done
}

# Combined image conversion and resizing
img_convert_resize() {
	if [ $# -lt 5 ]; then
		echo "Usage: img_convert_resize <images> <output_extension> <width> <height> <quality>"
		return 1
	fi

	local imgs=("${@:1:$#-4}")
	local out_ext=("${@: -4:1}")
	local width=("${@: -3:1}")
	local height=("${@: -2:1}")
	local quality=("${@: -1}")

	for img in "${imgs[@]}"; do
		if [ -f "$img" ]; then
			magick "$img" -quality "$quality" -resize "${width}x${height}>" "${img%.*}.$out_ext"
		else
			echo "Warning: File not found - $img"
		fi
	done
}

# Make Git directories safe
gitsafe() {
	find . -name ".git" -type d -exec bash -c 'git config --global --add safe.directory "${0%/.git}"' {} \;
}
