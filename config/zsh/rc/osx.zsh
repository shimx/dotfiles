# pyenv
# you need to install pyenv by homebrew
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# rbenv
# you need to install rbenv by homebrew
export RBENV_ROOT="$HOME/.rbenv"
export PATH="$RBENV_ROOT/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# plenv
# you need to install plenv by homebrew
#   and cpanm install by homebrew too
# http://tweeeety.hateblo.jp/entry/2015/05/06/022937
export PLENV_ROOT="$HOME/.plenv"
export PATH="$PLENV_ROOT/bin:$PATH"
if which plenv > /dev/null; then eval "$(plenv init -)"; fi
