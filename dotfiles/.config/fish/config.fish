set -U fish_greeting
set -U FZF_COMPLETE 1

if type -q micro
    set -x EDITOR micro
    set -x VISUAL micro
end

alias . 'cd .'

alias .1 'cd ..'
alias .. 'cd ..'

alias .2 'cd ../..'
alias ... 'cd ../..'

alias .3 'cd ../../..'
alias .... 'cd ../../..'

alias .4 'cd ../../../..'
alias ..... 'cd ../../../..'

if status --is-interactive
   if not functions -q fisher
       curl -sL https://git.io/fisher | fish
       fisher update
   end
end

if not contains $HOME/.local/bin $PATH
    set -gx PATH $HOME/.local/bin $PATH
end

set sponge_regex_patterns '^(python|node|go\s+run|ruby|perl|php)'

if not test -f $XDG_CONFIG_HOME/fish/completions/uv.fish
    uv --generate-shell-completion fish > $XDG_CONFIG_HOME/fish/completions/uv.fish
end

if not test -f $XDG_CONFIG_HOME/fish/completions/uvx.fish
    uvx --generate-shell-completion fish > $XDG_CONFIG_HOME/fish/completions/uvx.fish
end

if type -q host-shell
    function op
        host-shell op $argv
    end

    function warp-cli
        host-shell warp-cli $argv
    end

    function tailscale
        host-shell tailscale $argv
    end

    host-shell op completion fish ^/dev/null \
        > $XDG_CONFIG_HOME/fish/completions/op.fish

    host-shell tailscale completion fish ^/dev/null \
        > $XDG_CONFIG_HOME/fish/completions/tailscale.fish

    host-shell warp-cli generate-completions fish ^/dev/null \
        > $XDG_CONFIG_HOME/fish/completions/warp-cli.fish
end
