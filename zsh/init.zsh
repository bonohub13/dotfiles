#!/usr/bin/zsh

### init runs #####
. ~/.config/zsh/run_sshAgent.zsh
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
command -v neofetch && command -v lolcat \
    && neofetch | lolcat -f
###################

import_cargo(){
    source $HOME/.cargo/env
    echo "cargo for Rust installed."
}
