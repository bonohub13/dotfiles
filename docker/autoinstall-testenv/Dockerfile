FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN sed -i "s;http://archive.ubuntu.com/ubuntu/;mirror://mirrors.ubuntu.com/mirrors.txt;" /etc/apt/sources.list

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y software-properties-common
RUN apt-add-repository ppa:neovim-ppa/stable && apt-get update

RUN apt-get install -y \
    git \
    neovim \
    zsh

RUN mkdir "$HOME"/repos
RUN git clone https://github.com/bonohub13/dotfiles "$HOME/repos/dotfiles"
RUN git clone https://github.com/morhetz/gruvbox "$HOME/repos/gruvbox"
RUN mkdir -p "$HOME/.config"

CMD /bin/zsh
