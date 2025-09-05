if type -q zed
    set -x EDITOR zed
    set -x VISUAL zed
end

if type -q starship
    starship init fish | source
end

if status --is-interactive
    if not functions -q fisher
        set -q XDG_CONFIG_HOME; or set -gx XDG_CONFIG_HOME $HOME/.config
        curl -fsSL https://git.io/fisher | source; and fisher update
        exit
    end
end

if not test -f $XDG_CONFIG_HOME/fish/completions/uv.fish
    uv --generate-shell-completion fish >$XDG_CONFIG_HOME/fish/completions/uv.fish
end

if not test -f $XDG_CONFIG_HOME/fish/completions/uvx.fish
    uvx --generate-shell-completion fish >$XDG_CONFIG_HOME/fish/completions/uvx.fish
end
