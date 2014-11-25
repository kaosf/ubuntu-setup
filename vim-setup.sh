# for +lua +clipboard
sudo aptitude install vim-gtk
# or only +lua
#sudo aptitude install vim-nox

# install NeoBundle
if [ ! -d $HOME/.vim/bundle ]
then
  mkdir -p $HOME/.vim/bundle
fi
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
  libpython-dev libpython3-dev
mkdir -p $HOME/local/src
cd $HOME/local/src
# ref. https://github.com/vim-jp/vim
git clone https://github.com/vim-jp/vim
cd vim
git checkout v7-4-516
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
git reset HEAD --hard
git checkout master
