#!/usr/bin/zsh

### init runs #####
# root-less docker ENV
. ~/.config/zsh/.commands/run_sshAgent.sh
# nitrogen --restore && clear
neofetch | lolcat -f
###################

import_cargo(){
    source $HOME/.cargo/env
    echo "cargo for Rust installed."
}
