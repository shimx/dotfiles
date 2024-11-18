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
# brew installed anyenv
if command -v anyenv 1>/dev/null 2>&1
then
    if ! [ -f /tmp/anyenv.cache ]
    then
        anyenv init - --no-rehash > /tmp/anyenv.cache
        zcompile /tmp/anyenv.cache
    fi
    source /tmp/anyenv.cache
fi

###############################################
# openssl env                                 #
###############################################
export OPENSSLENV_ROOT="/usr/local/opt/openssl"
path=(${OPENSSLENV_ROOT}/bin ${path})
