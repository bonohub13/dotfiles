# Dotfiles for neovim

## Where to place
- Copy this directory (nvim) under $HOME/.config

## Dependencies
- Version of neovim must be 0.6 or higher to fully utilize this dotfile!
- Colortheme
    - dracula/vim
        [URL](https://github.com/dracula/vim)
    - morhetz/gruvbox
        [URL](https://github.com/morhetz/gruvbox.git)
- deno
    - Auto completion addon [Shougo/ddc.vim](https://github.com/Shougo/ddc.vim) requires this to run.

- ctags
    - [Tagbar](https://github.com/preservim/tagbar) requires ctags (universal-ctags) in order for it to function

- clangd, pyright
    - Auto completion addon (Based LSP (Language Server Protocol))[Shougo/ddc-nvim-lsp](https://github.com/Shougo/ddc-nvim-lsp)

- Packer
    - wbthomason/packer.nvim
        [URL](https://github.com/wbthomason/packer.nvim)
        - Installation
        ```bash
        git clone --depth 1 https://github.com/wbthomason/packer.nvim \
            "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"
        ```

## Updates
- Jan 24th, 2022
    - Deprecated support for vim
    - Using Packer.nvim instead of Vundle.vim
    - Rewrote the following settings in Lua
        - keybindings
        - plugin management
        - Variables and default Vim/Neovim options
