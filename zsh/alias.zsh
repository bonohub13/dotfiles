#!/usr/bin/zsh

##### alias #######
alias ls="ls --color=auto"
alias cls=clear
alias reboot="systemctl reboot -i"
alias shutdown="systemctl poweroff -i"
alias vim=nvim
alias cmake-init=". /home/kensuke/.cmake_init/cmake_init.bash"
alias sudo="sudo "

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

function update-archmirror {
    mirrorlist=`curl "https://archlinux.org/mirrorlist/?country=all&protocol=https&ip_version=4&ip_version=6&use_mirror_status=on"`
    mirrorlist_filtered=`echo $mirrorlist | sed -e "s/^#Server/Server/" -r -e "s/## +[^_]+//" -e "s/##//"`

    less $mirrorlist_filtered
    echo "rankmirrors and update mirror? [Y/N]"
    read ask
    if [ $ask = "Y" -o $ask = "y" ]; then
        sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
        sudo dash -c 'echo $mirrorlist_filtered | rankmirrors -n 20 - | tee /etc/pacman.d/mirrorlist.pacnew mirrorlist.bak'
        if [ $? = 0 ]; then
            echo "Updated mirrorlist to /etch/pacman.d/mirrorlist"
        else
            echo "Failed to update mirrorlist"
            echo "update-archmirror terminated..."
        fi
    else
        echo "update-archmirror terminated..."
    fi
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

function shebang {
    echo "#!"`which $1`
}

function help {
    less ~/.config/zsh/alias.zsh
}
