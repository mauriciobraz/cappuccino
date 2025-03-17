set -q PYENV_ROOT; or set -l PYENV_ROOT $HOME/.pyenv
set -gx PATH $PYENV_ROOT/bin $PYENV_ROOT/shims $PATH

status --is-interactive; and source (pyenv init - | psub)
