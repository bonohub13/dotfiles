#!/usr/bin/sh -eux

copy_configs() {
    echo "Copying dotfiles under $HOME/.config or $HOME... (depending on package)"
    sleep 1
    find -maxdepth 1 -type d | while read dir_name; do
        [ "$dir_name" != '.' ] || [ "$dir_name" != './.git' ] || [ "$dir_name" != './docker' ] \
            && [ `echo "$dir_name" | grep "\./\." | wc -c` -eq 0 ] \
            && target="$(echo "$dir_name" | sed "s./. ." | awk '{print$2}')" \
            && ([ -d "$HOME.config" ] || mkdir -p "$HOME/.config") \
            && ([ "$dir_name" = "./tmux" ] && cp "$dir_name/.tmux.conf" "$HOME" \
                || [ "$dir_name" = "./zsh" ] \
                && (find "$dir_name" -type f -name ".z*" | while read line; do
                        mv -f "$line" "$HOME"
                    done) \
                && cp -rf "$dir_name" "$HOME/.config" \
                && [ "$dir_name" = "./zsh" ] \
                && find "$HOME/.config/$dir_name" -type f -name ".z*" | while read file; do
                        mv "$file" "$HOME"
                    done \
                || return 0) \
            || [ "$dir_name" = "./nvim" ] \
            && command -v vim \
            && [ "$(ls -l '/usr/bin/vim' | awk '{print$NF}')" = "vim" ] \
            && cp -f "$dir_name/init.vim" "$HOME/.vimrc" \
            || cp -rf "$dir_name" "$HOME/.config"
    done
}

neovim_setup() {
    local vim_or_nvim="$([ -d "$HOME/.config/nvim" ] && echo "Neovim" || echo Vim)"
    echo "$vim_or_nvim..."
    git clone https://github.com/morhetz/gruvbox /tmp/gruvbox
    [ "$vim_or_nvim" = "Neovim" ] && mv /tmp/gruvbox/colors "$HOME/.config/nvim/" ||
        mkdir -p "$HOME/.vim" && mv /tmp/gruvbox/colors "$HOME/.vim/"
    rm -rf /tmp/gruvbox
}

tmux_setup() {
    echo "tmux..."
    mkdir -p "$HOME/.tmux/plugins"
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm" || return 0
    echo "Press <Ctrl+b> then I in tmux to load plugins"
}

warning() {
    echo 'echo "Warning! Running the automated script replaces any configurations you may have with the following..."
        find -maxdepth 1 -type d | while read program; do
            [ `echo "$program" | grep "./\." | wc -c` -eq 0 ] \
                && [ `echo "$program" | wc -c` -gt 2 ] \
                && echo "$program" | sed "s./. .g" | awk {print$2} | sed "s/^/\t/"
        done' | sed -e "s/{/'{/" -e "s/}/}'/" | sh
}
warning
echo "Are you sure you want to run the automated installer? [Y/N]"
read question
[ "$question" = "Y" ] || [ "$question" = "y" ] \
    && copy_configs \
    && echo "Downloading dependencies..." \
    && sleep 1 \
    && (command -v vim || command -v nvim \
        && neovim_setup || echo "Neovim nor Vim is in your system. Skipping...") \
    && (command -v zsh \
        && ./zsh_setup.zsh || echo "Zsh is not in your system, skipping...") \
    && (command -v tmux \
        && tmux_setup || echo "Tmux is not in your system, skipping...")
