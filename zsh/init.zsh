#!/usr/bin/zsh

### init runs #####
# root-less docker ENV
export PATH=/home/kensuke/bin:$PATH
export DOCKER_HOST=unix:///run/user/1000/docker.sock
. ~/.config/zsh/.commands/run_sshAgent.sh
# nitrogen --restore && clear
export EDITOR=nvim
neofetch | lolcat -f
###################

import_cargo(){
    source $HOME/.cargo/env
    echo "cargo for Rust installed."
}
