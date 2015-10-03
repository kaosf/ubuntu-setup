if [[ $1 = local ]]; then
  echo 'Build "automake" and "ncurse".' >&2
else
  sudo apt-get -y install automake libncurses5-dev libncursesw5-dev
  sudo apt-get -y remove tig
fi
git clone https://github.com/jonas/tig
cd tig
git checkout tig-2.2.1
./autogen.sh
if [[ $1 = local ]]; then
  ./configure --prefix=$HOME/local
  make
  make install
else
  ./configure
  make
  sudo make install
fi
git checkout master
cd -
if [[ $1 = local ]]; then
  mkdir -p $HOME/local/src
  rm -rf $HOME/local/src/tig
  mv tig $HOME/local/src
else
  sudo rm -rf /usr/local/src/tig
  sudo mv tig /usr/local/src
fi

# ref. for dependent packages:
#   https://github.com/jonas/tig/issues/39#issuecomment-4992269
