# Setup fzf
# ---------
if [[ ! "$PATH" == */home/donkey/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/donkey/.fzf/bin"
fi

eval "$(fzf --zsh)"
