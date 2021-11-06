#!/usr/bin/sh -eu

copy_configs() {
    echo "Copying dotfiles under $HOME/.config or $HOME... (depending on package)"
    sleep 1
    find -maxdepth 1 -type d | \
        sed -e "s;\./;;" \
            -e "/\.git/d" \
            -e "/docker/d" \
            -e "/installed_arch_pkgs/d" | \
    while read dir_name; do
        ([ -d "$HOME.config" ] || mkdir -p "$HOME/.config") \
            && ([ "$dir_name" = "tmux" ] \
                && cp "$dir_name/.tmux.conf" "$HOME") \
            || ([ "$dir_name" = "zsh" ] \
                && find "$dir_name" -type f -name "\.z*" | while read file; do
                    mv -f "$file" "$HOME"
                done) \
            && cp -rf "$dir_name" "$HOME/.config" \
            || ([ "$dir_name" = "nvim" ] \
                && command -v vim \
                && [ "$(ls -l '/usr/bin/vim' | awk '{print$NF}')" = "vim" ] \
                && mv -f "$dir_name/init.vim" "$HOME/.vimrc" \
                || cp -rf "$dir_name" "$HOME/.config")
    done

    return 0
}

neovim_setup() {
    local vim_or_nvim="$([ -d "$HOME/.config/nvim" ] \
        && echo "Neovim" || echo Vim)"
    echo "$vim_or_nvim..."
    [ "$vim_or_nvim" = "Neovim" ] \
        && git clone https://github.com/VundleVim/Vundle.vim "$HOME/.config/nvim/bundle/Vundle.vim" \
        || mkdir -p "$HOME/.vim/bundle" \
        && git clone https://github.com/VundleVim/Vundle.vim "$HOME/.vim/bundle/Vundle.vim" \
        && sed -i "s;config/nvim;vim;" "$HOME/.vimrc"
    [ "$vim_or_nvim" = "Neovim" ] \
        && nvim -c PluginInstall -c quit \
        || nvim -c PluginInstall -c quit

    return 0
}

tmux_setup() {
    echo "tmux..."
    mkdir -p "$HOME/.tmux/plugins"
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm" || return 0
    echo "Press <Ctrl+b> then I in tmux to load plugins"

    return 0
}

kitty_setup() {
    echo "Kitty..."
    mkdir -p "$HOME/.config/kitty"
    curl https://raw.githubusercontent.com/dracula/kitty/master/dracula.conf | \
        tee "$HOME/.config/kitty/dracula.conf" > /dev/null 2>&1
    curl https://raw.githubusercontent.com/dracula/kitty/master/diff.conf | \
        tee "$HOME/.config/kitty/diff.conf" > /dev/null 2>&1

    return 0
}

neofetch_setup() {
    echo "Neofetch..."
    mkdir -p "$HOME/.config/neofetch"
    curl https://raw.githubusercontent.com/tralph3/.dotfiles/master/.config/neofetch/config.conf | tee "$HOME/.config/neofetch/config.conf" > /dev/null 2>&1
    sleep 1
    echo "This config for neofetch is from https://github.com/tralph3/.dotfiles"
    echo "Check out his/her repository for more info!"
    echo "Power to this person!"
    sleep 1

    return 0
}

warning() {
    echo 'echo "Warning! Running the automated script replaces any configurations you may have with the following..."
        find -maxdepth 1 -type d | while read program; do
            [ `echo "$program" | grep "./\." | wc -c` -eq 0 ] \
                && [ `echo "$program" | wc -c` -gt 2 ] \
                && echo "$program" | sed "s./. .g" | awk {print$2} | sed "s/^/\t/"
        done' | sed -e "s/{/'{/" -e "s/}/}'/" | sh

    return 0
}
warning
([ $# -eq 1 ] && question="$1") \
    || [ $# -ne 1 ] \
    && echo "Are you sure you want to run the automated installer? [Y/N]" \
    && read question
    || ([ $# -gt 1 ] \
        && echo "ERROR: Expected arguments either value of {\"yes\", \"y\",\"Y\"}" \
        && exit 1)
[ "$question" = "Y" ] || [ "$question" = "y" ] || [ "$question" = "yes" ] \
    && copy_configs \
    && echo "Downloading dependencies..." \
    && sleep 1 \
    && (command -v vim || command -v nvim \
        && neovim_setup || echo "Neovim nor Vim is in your system. Skipping...") \
    && (command -v zsh \
        && ./zsh_setup.zsh || echo "Zsh is not in your system, skipping...") \
    && (command -v tmux \
        && tmux_setup || echo "Tmux is not in your system, skipping...") \
    && (command -v kitty \
        && kitty_setup || echo "Kitty is not in your system, skipping...") \
    && (command -v neofetch \
        && neofetch_setup || echo "Neofetch is not in your system. Skipping...")
