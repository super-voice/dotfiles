# Editor-related
set -o vi
export VISUAL=/usr/local/bin/vim
export EDITOR=/usr/local/bin/vim

# Locale-related
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Aliases-related
export LESS=' -R '
alias ls='gls --color=auto'
alias ll='ls -h1'
alias ldd='otool -L'

# Toolchain-related
APPLE_TOOLCHAIN_DIR="/Library/Developer/CommandLineTools"
CUSTOM_TOOLCHAIN_DIR=$HOME/build-rel
export PATH=$CUSTOM_TOOLCHAIN_DIR/bin:$APPLE_TOOLCHAIN_DIR/usr/bin:$PATH

# Pkg manager-related
export PKG_CONFIG_PATH=$HOME/lib/pkgconfig:/usr/local/lib/pkgconfig:/usr/local/opt/curl/lib/pkgconfig:/usr/local/opt/icu4c/lib/pkgconfig:/usr/local/opt/openssl/lib/pkgconfig:/usr/local/opt/sqlite/lib/pkgconfig:/usr/lib/pkgconfig
export PKG_CONFIG_LIBDIR=/usr/lib/pkgconfig:/usr/local/Library/ENV/pkgconfig/10.9
export ACLOCAL_PATH=/usr/local/share/aclocal

export PATH=$HOME/bin:/usr/local/bin:$/usr/local/sbin:/usr/local/opt/openssl/bin:/usr/local/opt/curl/bin:$PATH
export CPPFLAGS="-I$HOME/include -I/usr/local/opt/openssl/include -I/usr/local/opt/sqlite/include -I/usr/local/opt/curl/include"
export LDFLAGS="-L$HOME/lib -L/usr/local/opt/openssl/lib -L/usr/local/opt/sqlite/lib -L/usr/local/opt/curl/lib"
export DYLD_FALLBACK_LIBRARY_PATH=$HOME/lib:/usr/local/lib:/usr/local/opt/openssl/lib:/usr/local/opt/sqlite/lib:/usr/local/opt/curl/lib:/usr/lib

# Compiler-related
export ARCHFLAGS="-Wno-error=unused-command-line-argument"
export CXXFLAGS="-stdlib=libc++ -isystem /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1"

# Sanitizer-related
#export ASAN_OPTIONS="verbosity=3:malloc_context_size=30:log_path=$HOME/.asan/asan:color=never"
export ASAN_OPTIONS="verbosity=0:malloc_context_size=30:abort_on_error=1:color=always"

# Java-related
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_72.jdk/Contents/Home"
export JAVA_OPTS="-Dfile.encoding=UTF-8 -XX:MaxPermSize=256m"
export _JAVA_OPTIONS="-DsocksProxyHost=127.0.0.1 -DsocksProxyPort=1080"
export PATH="$JAVA_HOME/bin:$PATH"

# Python-related
export PYTHONPATH="$HOME/Library/Python/2.7/lib/python2.7/site-packages"
export PATH="$HOME/Library/Python/2.7/bin:$PATH"

# Ruby-related
export GEM_HOME=$HOME/.gems
export PATH="$GEM_HOME/bin:$PATH"

# Go-related
export GOPATH=$HOME/.go
export PATH="$GOPATH/bin:$PATH:/usr/local/opt/go/libexec/bin"

# Haskell-related
CABAL_BASE=$HOME/.cabal/bin
export PATH="$CABAL_BASE:$PATH"

# Homebrew-related
export HOMEBREW_BUILD_FROM_SOURCE=YES

# Other
export PATH="$HOME/arcanist/bin:$PATH"
export PATH="$PATH:$HOME/depot_tools"

# Autocompletion
. /usr/local/etc/bash_completion.d/git-completion.bash
. /usr/local/etc/bash_completion.d/git-prompt.sh
