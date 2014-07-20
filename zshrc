# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="ys"
# CASE_SENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="mm/dd/yyyy"
# ZSH_CUSTOM=/path/to/new-custom-folder
plugins=(git osx brew mercurial)
source $ZSH/oh-my-zsh.sh
# User configuration
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export VISUAL=/usr/local/bin/vim
export EDITOR=/usr/local/bin/vim
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
LESSPIPE=`which src-hilite-lesspipe.sh`
export LESSOPEN="| ${LESSPIPE} %s"
export LESS=' -R '
alias ls='ls -G'
alias ll='ls -h1'
export CC=clang
export CXX="clang++ -std=c++1y -stdlib=libc++"
export ARCHFLAGS="-Wno-error=unused-command-line-argument-hard-error-in-future"
export HOMEBREW_BUILD_FROM_SOURCE=YES
export GOPATH=$HOME/.go
export GEM_HOME=$HOME/.gems
export JAVA_HOME=`/usr/libexec/java_home -v 1.7`
export JAVA_OPTS="-Dfile.encoding=UTF-8 -XX:MaxPermSize=256m"
export WORKSPACE=$HOME/Documents/workspace
export PATH="$GEM_HOME/bin:$JAVA_HOME/bin:$GOPATH/bin:$HOME/.cabal/bin:$PATH:/usr/local/opt/go/libexec/bin:$HOME/.oclint/bin"
set -o vi
