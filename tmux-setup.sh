VERSION=2.3
if [[ $1 = local ]]; then
  echo 'Build "libevent-dev" and "libncurses-dev".' >&2
else
  sudo apt-get -y install libevent-dev libncurses-dev
  sudo apt-get -y remove tmux
fi
wget https://github.com/tmux/tmux/releases/download/${VERSION}/tmux-${VERSION}.tar.gz
tar xzf tmux-${VERSION}.tar.gz
rm -f tmux-${VERSION}.tar.gz
cd tmux-${VERSION}
if [[ $1 = local ]]; then
  ./configure --prefix=$HOME/local
  make
  make install
  mkdir -p $HOME/local/src
  cd -
  rm -rf $HOME/local/src/tmux-*
  mv tmux-${VERSION} $HOME/local/src
else
  ./configure
  make
  sudo make install
  cd -
  sudo rm -rf /usr/local/src/tmux-*
  sudo mv tmux-${VERSION} /usr/local/src
fi
