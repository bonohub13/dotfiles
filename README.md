# Dotfiles for my custom setup

## What dotfiles this repository includes
- zsh
- neovim
- tmux
- alacritty
- kitty
- Openbox (Used with LXQT)
    - The Openbox config is not tested with WM only environment in mind.<br/>
    Therefore cannot ensure that it works out of the box
- neofetch

## Dependencies
- For Neovim
    - ctags (universal-ctags)
    - clangd
        - For LSP in C/C++/Objective-C
    - ripgrep
    - Deno
        - [Instruction](https://deno.land)
    - jdtls-launcher
        - For LSP in Java
        - Needs Java 11+ in order to run
        - [Instruction](https://github.com/eruizc-dev/jdtls-launcher)

## Not a dotfile but...
- installed\_arch\_pkgs
    - list of installed arch packages
    1. zsh-syntax-highlighting
    2. zsh-autosuggestions
    3. neovim-symlinks (Replaces vim. vi with Neovim)
    4. ctags (universal-ctags for Tagbar in Vim/Neovim)
