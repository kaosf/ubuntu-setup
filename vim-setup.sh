# for +lua +clipboard
sudo aptitude install vim-gtk
# or only +lua
#sudo aptitude install vim-nox

# install NeoBundle
[ -d $HOME/.vim/bundle ] || mkdir -p $HOME/.vim/bundle
git clone git://github.com/Shougo/neobundle.vim $HOME/.vim/bundle/neobundle.vim

# execute :NeoBundleInstall in Vim command mode
# execute :NeoBundleUpdate to update
# execute :NeoBundleClean to cleaning

# setup ka-vim-snippets
git clone git://github.com/kaosf/ka-vim-snippets.git $HOME/.vim/ka-vim-snippets

# setup vimproc
cd $HOME/.vim/bundle/vimproc
make

## Build by myself
sudo aptitude install \
  lua5.2 liblua5.2-dev luajit libluajit-5.1-2 libluajit-5.1-dev \
  libperl-dev \
  libpython-dev libpython3-dev \
  ruby ruby-dev \
  libx11-dev libxt-dev libgtk2.0-dev
mkdir -p $HOME/local/src
cd $HOME/local/src
git clone https://github.com/vim/vim
cd vim
git checkout v7.4.838
./configure \
  --prefix=$HOME/local \
  --enable-gui=gtk2 \
  --enable-perlinterp=yes \
  --enable-pythoninterp=yes \
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
sudo aptitude install \
  lua5.2 liblua5.2-dev luajit libluajit-5.1-2 libluajit-5.1-dev \
  libperl-dev \
  libpython-dev libpython3-dev \
  ruby ruby-dev
# ...
./configure \
  --prefix=$HOME/local \
  --enable-perlinterp=yes \
  --enable-pythoninterp=yes \
  --enable-rubyinterp \
  --enable-luainterp=yes \
  --enable-multibyte \
  --enable-fail-if-missing \
  --with-features=huge \
  --with-luajit

## Update
cd vim
make clean
make distclean
git pull
# ./configure
make
make install
