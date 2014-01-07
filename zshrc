# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gianu"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
export UPDATE_ZSH_DAYS=7

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git node)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH
export MANPATH=$HOME/share/man:$MANPATH
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
LESSPIPE=`which src-hilite-lesspipe.sh`
export LESSOPEN="| ${LESSPIPE} %s"
export LESS='-R'
alias ls='ls -G'
alias ll='ls -h1'
export CC=clang
export CXX=clang++
export CFLAGS="-Wall -std=c99 -I$HOME/include -I/usr/local/include"
export CXXFLAGS="-Wall -Wno-c++98-compat -std=c++1y -I$HOME/include -I/usr/local/include"
export LDFLAGS=" -L$HOME/lib -L/usr/local/lib -lz -lpthread -lcurses -lm "
#export HOMEBREW_BUILD_FROM_SOURCE=YES

export GOPATH=$HOME/.local/go
export JAVA_HOME=`/usr/libexec/java_home -v 1.6`
export JAVA_OPTS="-Dfile.encoding=UTF-8 -XX:MaxPermSize=256m"
export VISUAL=/usr/local/bin/vim
export EDITOR=/usr/local/bin/vim

[ -s $HOME/.nvm/nvm.sh ] && . $HOME/.nvm/nvm.sh # This loads NVM
export PATH="$HOME/.rbenv/bin:$PATH"
source $HOME/bin/activate
eval "$(rbenv init -)"
source ~/.rbenv/completions/rbenv.zsh
#source ~/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh

#set -o vi
