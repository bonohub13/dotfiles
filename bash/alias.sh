#!/usr/bin/sh

# alias
alias cls=clear
alias vim=nvim

# functions
shebang() {
    echo "#!"`which $1`
}
