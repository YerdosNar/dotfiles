#!/usr/bin/env bash

alias nf='fastfetch'
alias btw='fastfetch'
alias ls='lsd --color auto --icon always'
alias grep='grep --color=auto'
alias lsh='ls -lF --total-size'
alias lah='ls -alF --total-size'
alias ll='ls -lF'
alias l='ls -lF'
alias la='ls -alF --git'
alias vim='nvim'
alias vi='vim'
alias vimdiff='nvim -d'
alias svim='sudo nvim'
alias gc='git clone'
alias gb='git branch'
alias gch='git checkout'
alias gadd='git add . && git diff --cached --stat'
alias gcached='git diff --cached'
alias findp='sudo pacman -Ss'
alias updt='sudo pacman -Syu --needed'
alias orphan='sudo pacman -Qtdi'
alias orphsh="sudo pacman -Qtdi | grep -E '(Name|Description|Installed Size)'"
alias rmvp='sudo pacman -Rns'
alias ..='cd ..'
alias cd..='cd ..'
alias py='python3'
alias rm='rm -i'
alias df='df -kTh'
alias ok='okular'
alias mk='make'
alias mc='make clean'
alias sctl='sudo systemctl'
alias src='source ~/.bashrc'

# Maven
alias mrun='./mvnw spring-boot:run'

alias sshroot='ssh root@ss.linm-m.com'
alias sshuser='ssh venni@ss.linm-m.com'
alias sshruss='ssh -p 8400 kartie@vps.linm-m.com'
alias sshstud='ssh -p 2222 s202311628@dakgalb15.kangwon.ac.kr'
alias myvpn='nohup sslocal -c ~/.config/shadowsocks/config.json &'

# To open files with ZATHURA
zt() {
    nohup zathura $1 >/dev/null
}

cdmv() {
    if [ $# -lt 2 ]; then
        echo "Usage: cdmv <source> <destination>"
        echo "Just like 'mv' command"
        return 1
    fi

    mv "$@" || return 1

    dest="${@: -1}"

    if [ -f "$dest" ]; then
        dest="$dirname "$dest")"
    fi

    cd "$dest" || return 1
}
