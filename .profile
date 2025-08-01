#
# ~/.profile
#

## Source
. "$HOME/.cargo/env"

# shellcheck source=/dev/null
# if [[ -d "$HOME/.config/profile" ]]; then
# 	for file in $(find "$HOME/.config/profile" -type f | sort); do
# 		. "$file"
# 	done
# fi

### Env variables

## PATH
export PATH="$PATH:$HOME/Apps/"
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/lmstudio/bin"

## Editor
export EDITOR='nvim'
export VISUAL='nvim'

## Pager
export LESS='-R'
export PAGER='less'
# export MANPAGER='less -R --use-color -Dd+r -Du+c -Du+ '

## Performance
# To enable Vulkan Video support in vulkan-intel. This can improve battery life
export ANV_DEBUG="video-decode,video-encode"

# SOFTWARE
GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export GEM_HOME

# CUSTOM
export TRASH="$HOME/.local/share/Trash"

## Aliases

# ls
alias ls='ls --color=auto'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -lh'
alias lla='ls -lah'

# lsd: ls deluxe
# alias l='lsd --group-dirs=first'
# alias la='lsd -a --group-dirs=first'
# alias ll='lsd -lh --group-dirs=first'
# alias lla='lsd -lha --group-dirs=first'
# alias ls='lsd --group-dirs=first'

# cat
alias bat='bat --color=always'
alias icat="kitty +kitten icat"

# Git
alias gitclean="find . -type d -name '.git' -execdir git clean -dfx \;"

# grep
alias grep='grep --color=auto'
alias egrep='grep -E --color=auto'
alias fgrep='grep -F --color=auto'
alias grepp='grep -P --color=auto'

## Functions

# Set code colors
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
