###############################################
# PROMPT override                             #
###############################################
# show current branch
# http://qiita.com/KENJU/items/f4880f0d73b434555511
# @see
# http://stackoverflow.com/questions/1128496/to-get-a-prompt-which-indicates-git-branch-in-zsh

if ! [ $USER = "root" ]
then
  local git==git
  setopt prompt_subst
  autoload -Uz vcs_info
  zstyle ':vcs_info:*' actionformats \
      '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
  zstyle ':vcs_info:*' formats       \
      '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
  zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

  zstyle ':vcs_info:*' enable git cvs svn

  # or use pre_cmd, see man zshcontrib
  vcs_info_wrapper() {
    vcs_info
    if [ -n "$vcs_info_msg_0_" ]; then
      echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
    fi
  }
  RPROMPT=$'$(vcs_info_wrapper)'$RPROMPT
fi

###############################################
# hub config                                  #
###############################################
if which hub > /dev/null
then
  function git(){hub "$@"} # zsh
fi

###############################################
# peco config                                 #
###############################################
if which peco > /dev/null
then
  function peco-src () {
    local selected_dir=$(ghq list --full-path | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
      BUFFER="cd ${selected_dir}"
      zle accept-line
    fi
    zle clear-screen
  }
  zle -N peco-src
  bindkey '^]' peco-src
fi

###############################################
# homebrew zsh-completions config             #
###############################################
if [ -e /usr/local/share/zsh-completions ]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
fi

###############################################
# lang env                                    #
###############################################
# pyenv
# you need to install pyenv by homebrew
export PYENV_ROOT="$HOME/.pyenv"
path=(${PYENV_ROOT}/bin ${path})
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# rbenv
# you need to install rbenv by homebrew
export RBENV_ROOT="$HOME/.rbenv"
path=(${RBENV_ROOT}/bin ${path})
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# plenv
# you need to install plenv by homebrew
#   and cpanm install by homebrew too
# http://tweeeety.hateblo.jp/entry/2015/05/06/022937
export PLENV_ROOT="$HOME/.plenv"
path=(${PLENV_ROOT}/bin ${path})
if which plenv > /dev/null; then eval "$(plenv init -)"; fi

###############################################
# openssl env                                 #
###############################################
export OPENSSLENV_ROOT="/usr/local/opt/openssl"
path=(${OPENSSLENV_ROOT}/bin ${path})
