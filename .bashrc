#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

[ -f ~/.fzf.bash ] && source "$HOME/.fzf.bash"

if [ -f "$HOME/.profile" ]; then
	. "$HOME/.profile"
fi

## Aliases

# ls
alias ls='ls --color=auto'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -lh'
alias lla='ls -lah'

## Keybinds

# Use emacs keybindings
set -o emacs

bind "^[[H":beginning-of-line # Home
bind "^[[F":end-of-line       # End
bind "DEL":delete-char        # Delete
bind "^[[1;3C":forward-word   # Alt + Right-arrow
bind "^[[1;3D":backward-word  # Alt + Left-arrow
bind "\C-e":forward-word      # Ctrl + e
bind "\C-b":backward-word     # Ctrl + b
