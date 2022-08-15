#!/usr/bin/zsh

##### alias #######
alias ls="ls --color=auto"
alias cls=clear
alias reboot="systemctl reboot -i"
alias shutdown="systemctl poweroff -i"
alias vim=nvim
alias cmake-init=". $HOME/.cmake_init/cmake_init.sh"
alias sudo="sudo "
[[ -f "$HOME/.config/zsh/hibernate.sh" ]] \
    && alias hibernate="$HOME/.config/zsh/hibernate.sh"
command -v pacman > /dev/null 2>&1 \
    && alias update-archmirror="sudo $HOME/.config/zsh/update_archmirror/update-archmirror.sh"
alias tmux="tmux -u -2"
command -v bat > /dev/null 2>&1 \
    && alias cat='bat -pp'
unalias rm mv cp

function ssh-keygen-strong {
    ssh-keygen -t ed25519
}

function enable-multithreaded-build {
if [[ `echo $MAKEFLAGS | grep "\-j$(nproc)"` = "" ]] || [[ $MAKEFLAGS = "" ]]; then
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
    echo '#!'`which $1 | sed "s;/usr;;"`
}

function pacman-autoremove {
    command -v pacman > /dev/null 2>&1 || return 1
    pkgs="$(pacman -Qdtq)"

    echo "Packages to remove"
    echo "$pkgs"

    if [ "$(echo $pkgs | grep -E "[A-Z | a-z | 0-9]" | wc -c)" -eq 0 ]; then
        echo "No packages available..."
    else

        printf "Are you okay? [Y/n] "
        read ans

        if [[ "$ans" != "y" ]] && [[ "$ans" != "Y" ]]; then
            echo "Packages not removed"
            return 1
        fi
            echo "$pkgs" | xargs sudo pacman -Rns --noconfirm
    fi

    return 0
}

function btop {
    if [[ "$TERM_PROGRAM" = "tmux" ]]; then
        tmux split -l 30 btop
    else
        /usr/bin/btop
    fi

    return $?
}

function ssh {
    if [[ "$TERM_PROGRAM" = "tmux" ]]; then
        tmux split ssh "$@"
    else
        /usr/bin/ssh "$@"
    fi

    return $?
}

function clock {
    if [[ "$TERM_PROGRAM" = "tmux" ]]; then
        tmux split -l 13 tty-clock -s -x -c -b -B
    else
        /usr/bin/tty-clock -s -x -c -b -B
    fi

    return $?
}

function radeontop {
    if command -v radeontop > /dev/null 2>&1
    then
        if [[ "$TERM_PROGRAM" = "tmux" ]]; then
            tmux split -l 19 radeontop -c -T
        else
            radeontop -c -T
        fi
    fi

    return $?
}

function optional-deps {
    if command -v pacman > /dev/null 2>&1
    then
        if [[ $1 != "" ]]
        then
            pacman -Qi $1 | grep 'Optional Deps' -A100 | while read line
            do
                if echo "$line" | grep 'Required By' > /dev/null 2>&1
                then
                    break
                else
                    echo "$line" \
                        | grep -v 'Optional Deps' \
                        | awk '{print$1}' \
                        | sed "s/:$//"
                fi
            done
        else
            echo "ERROR: Must provide package name."
        fi
    else
        echo "This command is only available for Archlinux based distro"

        return 1
    fi

    return $?
}

function help {
    less ~/.config/zsh/alias.zsh
}
