## PATH
export PATH="$PATH:$HOME/Apps"
export PATH="$PATH:$HOME/bin"

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
