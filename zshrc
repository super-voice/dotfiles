#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/depot_tools
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
LESSPIPE=`which src-hilite-lesspipe.sh`
export LESSOPEN="| ${LESSPIPE} %s"
export LESS=' -R '
alias ls='ls -G'
alias ll='ls -h1'
export CC=clang
export CXX=clang++
unset CXXFLAGS CFLAGS LDFLAGS CPPFLAGS
export ARCHFLAGS="-Wno-error=unused-command-line-argument-hard-error-in-future"
export HOMEBREW_BUILD_FROM_SOURCE=YES

export GOPATH=$HOME/.local/go
export JAVA_HOME=`/usr/libexec/java_home -v 1.7`
export PATH="$JAVA_HOME/bin:$GOPATH/bin:$PATH"
export WORKSPACE=$HOME/Documents/workspace
export JAVA_OPTS="-Dfile.encoding=UTF-8 -XX:MaxPermSize=256m"
export VISUAL=/usr/local/bin/vim
export EDITOR=/usr/local/bin/vim

export DOCKER_HOST=tcp://localhost:4243
#source ~/bin/activate
#
#set -o vi
