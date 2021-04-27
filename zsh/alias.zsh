# alias
alias sudo="sudo "
alias vim=nvim
alias cls=clear
alias sl=ls
alias vi=nvim
alias shutdown="systemctl poweroff -i"
alias reboot="systemctl reboot -i"
alias cmake-init=". $HOME/.cmake_init/cmake_init.bash"
alias tmux="tmux -u"

# function
function ssh-key-strong() {
    ssh-keygen -t ed25519
}
function enable-multithreaded-compile() {
    export MAKEFLAGS="-j$(nproc)"
}
function unzip-windows() {
    unzip -O CP932 $1
}
function shebang() {
    arg=$1
    echo "#!"`which ${arg}`
}
function oracle-xe-start() {
    $HOME/.config/zsh/init_oracle.bash
}
