#!/usr/bin/env bash

set -euo pipefail

GRN="\033[32m"
BLU="\033[34m"
RST="\033[0m"
info()          { echo -e "${BLU}[i]${RST} $1"; }
success()       { echo -e "${GRN}[v]${RST} $1"; }

PKG_MNGR=Unknown

set_pkg_manager() {
        info "Detecting OS.."
        source /etc/os-release
        success "Detected ${GRN}$ID${RST}"

        info "Initializing package manager..."
        case "$ID" in
                arch)
                        PKG_MNGR=pacman
                        ;;
                debian|ubuntu|kali)
                        PKG_MNGR=apt
                        ;;
                alma|fefora)
                        PKG_MNGR=dnf
                        ;;
                *)
                        PKG_MNGR=Uknown
                        ;;
        esac
        success "Package Manager: ${GRN}$PKG_MNGR${RST}"
}

main() {
        info "Bringing initial .bash* files..."
        wget https://raw.githubusercontent.com/YerdosNar/dotfiles/master/.bash_aliases
        wget https://raw.githubusercontent.com/YerdosNar/dotfiles/master/.bashrc

        set_pkg_manager
        info "Installing ${BLU}lsd neovim${RST}"
        if [ "$PKG_MNGR" == "pacman" ]; then
                sudo pacman -Syu lsd neovim fastfetch --noconfirm --needed

                info "Adding aliases..."
                echo "# script generated aliases"             >> .bash_aliases
                echo ""                                       >> .bash_aliases
                echo "alias findp='sudo pacman -Ss'"          >> .bash_aliases
                echo "alias rmvp='sudo pacman -Rns'"          >> .bash_aliases
                echo "alias updt='sudo pacman -Syu --needed'" >> .bash_aliases
        else
                info "Updating..."
                sudo $PKG_MNGR update

                info "Upgrading..."
                sudo $PKG_MNGR upgrade

                info "Installing..."
                sudo $PKG_MNGR install lsd neovim fastfetch -y

                info "Adding aliases..."
                echo "# script generated aliases"           >> .bash_aliases
                echo ""                                     >> .bash_aliases
                echo "alias findp='sudo $PKG_MNGR search'"  >> .bash_aliases
                echo "alias updt='sudo $PKG_MNGR update && sudo $PKG_MNGR upgrade'" >> .bash_aliases
                echo "alias instl='sudo $PKG_MNGR install'" >> .bash_aliases
                echo "alias rmvp='sudo $PKG_MNGR remove'"   >> .bash_aliases
        fi

        success "DONE!"
}

main "$@"
