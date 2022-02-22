#!/usr/bin/zsh

### init runs #####
#: Autoinitializes ssh agent to keep the passwords
#: for clients/hosts that have the public key of this
#: device. (commented out by default)
# . ~/.config/zsh/.commands/run_sshAgent.sh
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
command -v neofetch > /dev/null 2>&1 \
    && command -v lolcat > /dev/null 2>&1 \
    && neofetch | lolcat -f
###################

import_cargo(){
    source $HOME/.cargo/env
    echo "cargo for Rust installed."
}
