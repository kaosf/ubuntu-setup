# for +lua +clipboard
sudo apt-get -y install vim-gtk
# or only +lua
#sudo apt-get -y install vim-nox

# install dein.vim and ka-vim-sinppets
if [ ! -d $HOME/.vim/dein ]; then
  curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh | bash -s $HOME/.vim/dein
fi
# execute :call dein#install() in Vim command mode
git clone git://github.com/kaosf/ka-vim-snippets.git $HOME/.vim/ka-vim-snippets

# setup vimproc
cd $HOME/.vim/bundle/vimproc
make

# Install Python 3 "neovim" package
sudo apt-get -y install python3-pip
pip3 install --user neovim

## Build by myself
sudo apt-get -y install \
  lua5.2 liblua5.2-dev luajit libluajit-5.1-2 libluajit-5.1-dev \
  libperl-dev \
  libpython-dev libpython3-dev \
  ruby ruby-dev \
  libx11-dev libxt-dev libgtk2.0-dev
mkdir -p $HOME/local/src
cd $HOME/local/src
if [ -d vim ]; then
  cd vim
  git fetch origin
else
  git clone https://github.com/vim/vim
  cd vim
fi
VERSION=`git tag -l | sort --version-sort | tail -1`
git checkout $VERSION
NAME=`git config user.name`
if [ $? != 0 -o -z $NAME ]; then
  NAME=`whoami`
fi
EMAIL=`git config user.email`
if [ $? != 0 -o -z $EMAIL ]; then
  EMAIL=${NAME}@`hostname`
fi
./configure \
  --with-compiledby="${NAME} <${EMAIL}>" \
  --prefix=$HOME/local \
  --enable-gui=gtk2 \
  --enable-perlinterp=yes \
  --enable-python3interp=yes \
  --enable-rubyinterp \
  --enable-luainterp=yes \
  --enable-multibyte \
  --enable-fail-if-missing \
  --with-features=huge \
  --with-x \
  --with-luajit
make
make install

# Without X
sudo apt-get -y install \
  lua5.2 liblua5.2-dev luajit libluajit-5.1-2 libluajit-5.1-dev \
  libperl-dev \
  libpython-dev libpython3-dev \
  ruby ruby-dev
mkdir -p $HOME/local/src
cd $HOME/local/src
if [ -d vim ]; then
  cd vim
  git fetch origin
else
  git clone https://github.com/vim/vim
  cd vim
fi
VERSION=`git tag -l | sort --version-sort | tail -1`
git checkout $VERSION
NAME=`git config user.name`
if [ $? != 0 -o -z $NAME ]; then
  NAME=`whoami`
fi
EMAIL=`git config user.email`
if [ $? != 0 -o -z $EMAIL ]; then
  EMAIL=${NAME}@`hostname`
fi
./configure \
  --with-compiledby="${NAME} <${EMAIL}>" \
  --prefix=$HOME/local \
  --enable-perlinterp=yes \
  --enable-python3interp=yes \
  --enable-rubyinterp \
  --enable-luainterp=yes \
  --enable-multibyte \
  --enable-fail-if-missing \
  --with-features=huge \
  --with-luajit
make
make install

## Update
cd vim
make clean
make distclean
git pull
# ./configure
make
make install
