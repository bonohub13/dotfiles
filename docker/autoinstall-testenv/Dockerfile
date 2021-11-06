FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    ca-certificates \
    apt-utils

RUN sed -i "s;http://archive.ubuntu.com/ubuntu/;mirror://mirrors.ubuntu.com/mirrors.txt;" /etc/apt/sources.list

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y software-properties-common
RUN apt-add-repository ppa:neovim-ppa/stable && apt-get update

RUN apt-get install -y \
    git \
    curl \
    neovim \
    zsh \
    zsh-syntax-highlighting \
    zsh-autosuggestions \
    tmux \
    neofetch

RUN mkdir "$HOME"/repos
RUN git clone https://github.com/bonohub13/dotfiles "$HOME/repos/dotfiles"
RUN mkdir -p "$HOME/.config"
RUN cd "$HOME/repos/dotfiles" && ./autoinstall.sh yes

CMD /bin/zsh
