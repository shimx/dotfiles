# Terminal Colorの設定
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

alias ls='ls -alh --color'
alias vi='/usr/local/bin/vim'
alias vim='/usr/local/bin/vim'

export PATH

# man path
MANPATH=/usr/local/man:$MANPATH
export MANPATH
INFOPATH=/usr/local/info:$INFOPATH
export INFOPATH

# Java
export JAVA_HOME=/usr/java/default
export PATH=$JAVA_HOME/bin:$PATH

# Maven2
export MAVEN_HOME=/usr/local/apache-maven-2.2.1
export PATH=$MAVEN_HOME/bin:$PATH
export MAVEN_OPTS=-Xmx1024M

export PATH=$PATH:$HOME/.cabal/bin
