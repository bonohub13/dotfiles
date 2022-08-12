#!/usr/bin/zsh -eux

### init runs #####
. ~/.config/zsh/.commands/run_sshAgent.sh
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
command -v neofetch > /dev/null 2>&1 \
    && command -v lolcat > /dev/null 2>&1 \
    && neofetch | lolcat -f
###################

#import_cargo(){
#    source $HOME/.cargo/env
#    echo "cargo for Rust installed."
#}
