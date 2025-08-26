# lsd: ls deluxe
alias l='lsd --group-dirs=first'
alias la='lsd -A --group-dirs=first'
alias ll='lsd -lh --group-dirs=first'
alias lla='lsd -lha --group-dirs=first'
alias ls='lsd --group-dirs=first'

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
	run-help-p4 \
	run-help-perf \
	run-help-podman \
	run-help-ssh \
	run-help-sudo \
	run-help-svn \
	run-help-svnadmin
do
	(( $+functions[$helper] )) || autoload -Uz $helper
done

# Remove the default alias (often points to `man`)
(( ${+aliases[run-help]} )) && unalias run-help

# Aliasing `run-help` to `help`
alias help=run-help
