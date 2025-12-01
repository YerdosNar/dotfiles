# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ALIASES

if [ -f ~/.bash_aliases ]; then
    # Add aliases into this file
    . ~/.bash_aliases
fi

# PROFILE

# ANSI color codes
RED='\033[0;31m\]'
GREEN='\033[0;32m\]'
YELLOW='\033[1;33m\]'
BLUE='\033[0;34m\]'
NC='\033[0m\]' # No Color

PS1="${GREEN}\u${NC}@${RED}\h${NC}${BLUE}\w${NC}\n\$ "

# HISTORY
HISTCONTROL=ignoreboth
HISTSIZE=5000
HISTFILESIZE=5000
HISTIGNORE="..:cd..:pwd:ll:la:ls:history:nf:cmatrix"

# EXPORTS
export PATH="$HOME/.cargo/bin:$PATH"
# export GTK_IM_MODULE fcitx
# export QT_IM_MODULE fcitx
# export XMODIFIERS @im=fcitx
# export INPUT_METHOD fcitx
# pnpm
export PNPM_HOME="/home/yerdos/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
export PATH=$PATH:~/.npm-global/bin

# SHOPTS
shopt -s globstar
shopt -s cdspell
shopt -s autocd
shopt -s dirspell
shopt -s histappend
shopt -s checkwinsize

# EVERY-BLOODY-TIME!!! NEOFETCH
nf

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
