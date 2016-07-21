# Terminal Colorの設定
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

alias ls='ls -alh --color'
alias vi='/usr/local/bin/vim'
alias vim='/usr/local/bin/vim'

# man path
manpath=(/usr/local/man(N-/) ${manpath})
INFOPATH=/usr/local/info:$INFOPATH
export INFOPATH

# Java
export JAVA_HOME=/usr/java/default
path=(${JAVA_HOME}/bin(N-/) ${path})

# Maven2
export MAVEN_HOME=/usr/local/apache-maven-2.2.1
export MAVEN_OPTS=-Xmx1024M
path=(${MAVEN_HOME}/bin(N-/) ${path})

path=(${path} ${HOME}/.cabal/bin(N-/))
