#!/usr/bin/zsh

##### alias #######
alias ls="ls --color=auto"
alias cls=clear
alias reboot="systemctl reboot -i"
alias shutdown="systemctl poweroff -i"
alias vim=nvim
alias cmake-init=". /home/kensuke/.cmake_init/cmake_init.sh"
alias sudo="sudo "
command -v pacman > /dev/null 2>&1 \
    && alias update-archmirror="sudo /home/kensuke/.config/zsh/update_archmirror/update-archmirror.sh"
alias tmux="tmux -u -2"
command -v radeontop > /dev/null 2>&1 \
    && alias radeontop="radeontop -cT"

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

function pacman-autoremove {
    command -v pacman > /dev/null 2>&1 || return 1
    pkgs="$(pacman -Qdtq)"

    if [ "$(echo $pkgs | grep -E "[A-Z | a-z | 0-9]" | wc -c)" -eq 0 ]; then
        echo "No packages available..."
    else
        sudo pacman -Rns "$pkgs"
    fi

    return 0
}

function help {
    less ~/.config/zsh/alias.zsh
}
