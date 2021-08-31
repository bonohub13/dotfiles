#!/usr/bin/zsh

##### alias #######
alias ls="ls --color=auto"
alias cls=clear
alias reboot="systemctl reboot -i"
alias shutdown="systemctl poweroff -i"
alias vim=nvim
alias cmake-init=". /home/kensuke/.cmake_init/cmake_init.sh"
alias sudo="sudo "
alias update-archmirror="sudo /home/kensuke/.config/zsh/update_archmirror/update-archmirror.sh"
alias pacman-autoremove="yay -Rns $(pacman -Qdtq)"
alias tmux="tmux -u -2"

function ssh-keygen-strong {
    ssh-keygen -t ed25519
}

function enable-multithreaded-build {
if [[ `echo $MAKEFLAGS | grep "j$(nproc)"` = "" ]]; then
        export MAKEFLAGS="-j$(nproc) $MAKEFLAGS"
    else
        echo "enable-multithreaded-build already has been loaded."
    fi
}

function add-githubkey {
    ssh-add ~/.ssh/github/id_rsa
}

function unzip-windows {
    unzip -O CP932 $1
}

function ssh-passX {
    ssh -Y -C $1
}

function check-weather {
    curl v2.wttr.in/Tokyo
}

function check-port {
    port=$1
    process=`netstat -tulpn | grep $1 | awk '{print $7}'`
    process_name=`echo $process | sed -e "s/\// /" | awk '{print $2}'`
    
    if [ $process_name = "" ]; then
        echo "Process using port $port does not exist."
        return 1
    else
        echo "Process using $port is $process_name"
        echo "Do you wish to kill this process? [Y/N]"
        read ask
        if [ $ask = "Y" -o $ask = "y" ]; then
            kill ${process%%/*}
            echo "Process $process successfully killed..."
        else
            echo "Process $process not killed..."
        fi
    fi

    return 0
}

function youtube-flac {
    youtube-dl -f bestaudio --extract-audio --audio-format flac --audio-quality 0 "$1"
}

function shebang {
    echo "#!"`which $1`
}

function clock {
    tty-clock -s -x -c -b -B
}

function help {
    less ~/.config/zsh/alias.zsh
}
