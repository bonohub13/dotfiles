FROM archlinux

RUN sed -i "s/#Parallel/Parallel/" /etc/pacman.conf

RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm base-devel

RUN pacman -S --noconfirm \
    git \
    curl \
    neovim \
    zsh \
    zsh-syntax-highlighting \
    zsh-autosuggestions \
    tmux \
    neofetch \
    ctags \
    deno \
    clang \
    ripgrep

RUN mkdir "$HOME"/repos
RUN git clone https://github.com/bonohub13/dotfiles "$HOME/repos/dotfiles"
RUN mkdir -p "$HOME/.config"
RUN cd "$HOME/repos/dotfiles" && ./autoinstall.sh yes
RUN mkdir -p "$HOME/.cache/zsh" "$HOME/.ssh" && touch "$HOME/.cache/zsh/history"

CMD /bin/zsh
