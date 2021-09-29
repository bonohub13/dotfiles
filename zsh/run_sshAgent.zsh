#!/usr/bin/zsh

SSH_ENV="$HOME/.ssh/agent-environment"

function start-agent {
    echo "Initializing new SSH agent..."
    /usr/bin/ssh-agent | sed "s/^echo/#echo/" > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add
}

if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start-agent;
    }
else
    mkdir "$HOME/.ssh"
    touch "$SSH_ENV"
    start-agent
fi
