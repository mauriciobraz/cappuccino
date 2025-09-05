if [[ $- == *i* && -n $HOME ]]; then
    export SSH_AUTH_SOCK=$HOME/.1password/agent.sock
fi
