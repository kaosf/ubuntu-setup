# ref. https://github.com/Homebrew/linuxbrew#installation

sudo apt-get install build-essential curl git m4 ruby texinfo libbz2-dev libcurl4-openssl-dev libexpat-dev libncurses-dev libncursesw5-dev zlib1g-dev

ruby -e "$(wget -O- https://raw.github.com/Homebrew/linuxbrew/go/install)"
# Press Enter
echo 'export PATH="$HOME/.linuxbrew/bin:$PATH"'                >> $HOME/.zshenv
echo 'export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"'    >> $HOME/.zshenv
echo 'export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"' >> $HOME/.zshenv
source $HOME/.zshenv
brew install tmux tig ag jq
echo 'export PKG_CONFIG_PATH=/usr/lib/x86_64-linux-gnu/pkgconfig' >> $HOME/.zshenv
wget https://raw.githubusercontent.com/m4i/cdd/master/cdd -O $HOME/.cdd-source
