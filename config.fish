# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish
set fish_greeting "Welcome back"

# Theme
set fish_theme coffeeandcode

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler
set fish_plugins rbenv node python rake

# Path to your custom folder (default path is $FISH/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish
set -x PATH $HOME/bin /usr/local/bin /usr/local/sbin/ $PATH $HOME/depot_tools
set -x MANPATH $HOME/share/man $MANPATH
set LESSPIPE /usr/local/bin/src-hilite-lesspipe.sh
set -x LESS '-R'
set -x GOPATH $HOME/.local/go
set -x PATH $GOPATH/bin $PATH
#set -x EDITOR /usr/local/bin/vim
set -x CC clang
set -x CXX clang++
set -x CFLAGS "-Wall -std=c99 -I$HOME/include -I/usr/local/include -I/usr/include"
set -x CXXFLAGS "-Wall -Wno-c++98-compat -std=c++1y -I$HOME/include -I/usr/local/include -I/usr/include"
set -x  LDFLAGS " -L$HOME/lib -L/usr/local/lib -L/usr/lib -lz -lpthread -lcurses -lm "

