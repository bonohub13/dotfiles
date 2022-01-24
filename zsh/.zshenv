command -v ibus &> /dev/null && keyboard="ibus" \
    || command -v fcitx &> /dev/null && keyboard="fcitx" \
    || command -v fcitx5 &> /dev/null && keyboard="fcitx5" || keyboard=""
export GTK_IM_MODULE="$keyboard"
export QT_IM_MODULE="$keyboard"
export XMODIFIERS="@im=$keyboard"
export GLFW_IM_MODULE="ibus"

# root-less docker ENV
export PATH="$HOME/bin:$PATH"
export DOCKER_HOST=unix:///run/user/1000/docker.sock

# editor stuff
export EDITOR=nvim
export VISUAL=nvim

# Language stuff
export LC_ALL=en_US.UTF-8
export LANGUAGE=en_US
