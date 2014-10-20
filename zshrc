# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="ys"
CASE_SENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
# DISABLE_LS_COLORS="true"
DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="mm/dd/yyyy"
# ZSH_CUSTOM=/path/to/new-custom-folder
plugins=(git osx brew)
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
alias ldd='otool -L'
COMMONFLAGS="-march=native -fdiagnostics-format=vi -fdiagnostics-show-category=name -fcolor-diagnostics -pedantic -Wall -Wextra -Wno-long-long -Wno-unused-parameter"
export CFLAGS="$COMMONFLAGS"
export CXXFLAGS="-stdlib=libc++ $COMMONFLAGS -Woverloaded-virtual"
export ARCHFLAGS="-Wno-error=unused-command-line-argument-hard-error-in-future"
export CFLAGS_DEBUG="$CFLAGS -fno-omit-frame-pointer -g -O0"
export CXXFLAGS_DEBUG="$CXXFLAGS -fno-omit-frame-pointer -g -O0"
export CC="clang $CFLAGS"
export CXX="clang++ $CXXFLAGS"
export HOMEBREW_BUILD_FROM_SOURCE=YES
export GOPATH=$HOME/.go
export GEM_HOME=$HOME/.gems
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_72.jdk/Contents/Home"
export JAVA_OPTS="-Dfile.encoding=UTF-8 -XX:MaxPermSize=256m"
export _JAVA_OPTIONS="-DsocksProxyHost=127.0.0.1 -DsocksProxyPort=1080"
export WORKSPACE=$HOME/Documents/workspace
export ASAN_SYMBOLIZER_PATH=/usr/local/bin/llvm-symbolizer-3.5
#export ASAN_OPTIONS="verbosity=3:malloc_context_size=30:log_path=$HOME/.asan/asan:color=never"
export ASAN_OPTIONS="verbosity=1:malloc_context_size=30:abort_on_error=1:color=always"
export PYTHONPATH="$HOME/Library/Python/2.7/lib/python/site-packages:/usr/local/lib/python2.7/site-packages:/Library/Python/2.7/site-packages"
export DEVELOPER_DIR="/Applications/Xcode.app/Contents/Developer"
export ANDROID_HOME="$HOME/android-sdk"
export ANDROID_NDK_HOME="$HOME/android-ndk"
export PATH="$HOME/Library/Python/2.7/bin:$GEM_HOME/bin:$JAVA_HOME/bin:$GOPATH/bin:$HOME/.cabal/bin:$PATH:/usr/local/opt/go/libexec/bin:$HOME/depot_tools"
export PATH="$ANDROID_NDK_HOME:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$HOME/.cov-analysis/bin:$PATH"
export CAML_LD_LIBRARY_PATH="$HOME/.opam/system/lib/stublibs:/usr/local/lib/ocaml/stublibs";
export PERL5LIB="$HOME/.opam/system/lib/perl5";
export OCAML_TOPLEVEL_PATH="$HOME/.opam/system/lib/toplevel";
export PATH="$HOME/.opam/system/bin:$PATH"
set -o vi
