if [ -S "$HOME/.1password/agent.sock" ]; then
	export SSH_AUTH_SOCK="$HOME/.1password/agent.sock"
elif [ -S "/run/user/$(id -u)/1password/agent.sock" ]; then
	export SSH_AUTH_SOCK="/run/user/$(id -u)/1password/agent.sock"
fi
