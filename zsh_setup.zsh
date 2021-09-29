#!/bin/zsh -eux

zsh_setup() {
    echo "zsh..."
    git clone --recursive https://github.com/sorin-ionescu/prezto "${ZDOTDIR:-$HOME/.zprezto}" || echo "${ZDOTDIR:-$HOME/.zprezto} already exists."
    setopt EXTENDED_GLOB
    for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
        [ -f "${ZDOTDIR:-$HOME}/.${rcfile:t}" ] \
            || ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    done
}

zsh_setup
