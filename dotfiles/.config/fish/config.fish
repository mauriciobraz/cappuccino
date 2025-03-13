
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

for command in abroot apx vso op tailscale
    type -q command && $command completion fish > $XDG_CONFIG_HOME/$command.fish
end

type -q warp-cli && warp-cli generate-completions fish > $XDG_CONFIG_HOME/warp-cli.fish
