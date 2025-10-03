#
# ~/.bashrc
#

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
HISTSIZE=5000
HISTFILESIZE=5000
HISTIGNORE="pwd:la:ls:history:nf:cmatrix"

# EXPORTS
export PATH="$HOME/.cargo/bin:$PATH"

# SHOPTS
shopt -s globstar
shopt -s cdspell
shopt -s autocd
shopt -s dirspell

# EVERY-BLOODY-TIME!!! NEOFETCH
nf
