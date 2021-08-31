# Dotfiles for zsh

## Where to place
- Copy zsh directory under $HOME/.config

## How to use
- source this dotfiles by adding the line below to ~/.zshrc
    - ```source $HOME/.config/zsh/config```<br/>

## Dependencies
- zprezto
    - [sorin-ionescu/prezto](https://github.com/sorin-ionescu/prezto)
    1. ```git clone --recursive https://github.com/sorin-ionescu/prezto "${ZDOTDIR:~$HOME/.zprezto}"```
    2. ```setopt EXTENDED_GLOB\
    for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do\
        ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"\
    done```
