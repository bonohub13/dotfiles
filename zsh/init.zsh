#!/usr/bin/zsh

### init runs #####
. ~/.config/zsh/.commands/run_sshAgent.sh
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
neofetch | lolcat -f
###################

import_cargo(){
    source $HOME/.cargo/env
    echo "cargo for Rust installed."
}
