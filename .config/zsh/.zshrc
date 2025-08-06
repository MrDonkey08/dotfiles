# Enable Powerlevel10k instant prompt. Should stay at the top of ~/.zshrc.
if [ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]; then
	\. "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

## Sources

# Sources all custom zsh config files
for file in $(find "${XDG_CONFIG_HOME:-$HOME.config}/zsh/custom/" -xtype f | sort); do
	\. "$file";
done


[ -s "$HOME/.profile" ] && \. "$HOME/.profile"

## Zsh config

# Set up the prompt
autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=$HOME/.zsh_history

if [ -s "$HOME/powerlevel10k/powerlevel10k.zsh-theme" ]; then
	\. "$HOME/powerlevel10k/powerlevel10k.zsh-theme"
fi

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[ ! -f "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/.p10k.zsh" ] || \
	\. "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/.p10k.zsh"

# Finalize Powerlevel10k instant prompt. Should stay at the bottom of ~/.zshrc.
(( ! "${+functions[p10k-instant-prompt-finalize]}" )) \
	|| p10k-instant-prompt-finalize
