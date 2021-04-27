. $HOME/.config/zsh/run_sshAgent.zsh
# ===== docker rootless ENV =====
export XDG_RUNTIME_DIR=$HOME/.docker/run
export PATH=$HOME/bin:$PATH
export DOCKER_HOST=unix:///run/user/1000/docker.sock
# ===============================
# ======== Oracle DB ENV ========
export ORACLE_HOME=/usr/lib/oracle/product/11.2.0/xe
export ORACLE_SID=XE
export NLS_LANG=`$ORACLE_HOME/bin/nls_lang.sh`
export PATH=$PATH:$ORACLE_HOME/bin
# ======== fcitx ================
export GTK_IM_MODULE=fcitx
export GTK_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
# ===============================
export EDITOR=nvim
clear && neofetch | lolcat -f
