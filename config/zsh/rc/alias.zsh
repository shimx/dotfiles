###############################################
# 追加エイリアス設定                          #
###############################################

alias where="command -v"

alias h='history -E -32'

alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"

# process
# alias j="jobs -l"
alias 'ps?'='pgrep -l -f'
alias pk='pkill -f'

# du/df
alias du="du -h"
alias df="df -h"
alias duh="du -h ./ --max-depth=1"

# su
alias su="su -l"

# vim
alias v='vim'
alias 'src'='exec zsh'
alias -g V="| vim -"
alias -g EV="| xargs --verbose sh -c 'vim \"\$@\" < /dev/tty'"

# rails
alias -g RET="RAILS_ENV=test"
alias -g RED="RAILS_ENV=development"
alias -g REP="RAILS_ENV=production"

# rake
alias raket='RAILS_ENV=test rake'
alias raked='RAILS_ENV=development rake'
alias rakep='RAILS_ENV=production rake'

# colorized cat
alias ccat='pygmentize -O style=vim -f console256 -g'

# less
alias less='less -r'

# grep
alias 'gr'='grep --color=auto -ERUIn'

# ag
alias 'ag'='ag --pager="less -R"'

#make
alias 'm'='make'
alias 'mn'='make native-code'
alias 'mc'='make clean'

# screen
alias s='screen -U'
alias sc='screen -S main'
alias sn='screen'
alias sl='screen -ls'
alias sr='screen -r main'
alias srr='screen -U -D -RR'

# tmux
alias tm='tmux'
alias tma='tmux attach'
alias tma0='tmux attach -t 0'
alias tma1='tmux attach -t 1'
alias tma2='tmux attach -t 2'
alias tml='tmux list-sessions'

alias pon='predict-on'
alias poff='predict-off'
alias p='ping -c 4'

#alias ls='ls -al'
alias cp='nocorrect cp -irp'
alias refe='nocorrect refe'

# git
alias g='git'
alias gi='git'
alias gs='git status -s -b'
alias gst='git status -s -b'
alias gst="git log --date=short --max-count=1 --pretty=format:'%Cgreen%h %cd %Cblue%cn%x09%Creset%s' | tail -1 && echo '' && git status -s -b"
alias gc='git commit'
alias gci='git commit -a'
alias '偽ｔ'=git

alias java='nocorrect java'
alias cp='nocorrect cp -irp'
alias erl='nocorrect erl'
alias sbcl='nocorrect sbcl'
alias gosh='nocorrect gosh'
alias node='nocorrect node'
# alias hg='nocorrect hg --encoding=utf-8'

# scala
alias scala='scala -deprecation -unchecked -explaintypes'
alias scc='scalac -deprecation -unchecked -explaintypes'
alias sci='scala -deprecation -unchecked -explaintypes -cp $SCALA_CLASSPATH -i ~/import.scala'
alias sce='scala'

alias be='bundle exec'

grepvim() {
    XFS=`grep -ERUInl $* | uniq | xargs`
    if [ "$XFS" ] ; then
      vim `grep -ERUInl $* | uniq | xargs`
    fi
}
alias grv='grepvim'

gem-install() {
    gem install $1 && rbenv rehash
}
