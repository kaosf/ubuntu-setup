# ref. http://www.vim.org/mercurial.php
mkdir -p $HOME/local/src && cd $HOME/local/src
hg clone https://vim.googlecode.com/hg/ vim
cd vim
hg pull
hg update
cd src
make

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
