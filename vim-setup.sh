# install newer Vim
# ref. http://linuxg.net/how-to-install-vim-7-4-on-ubuntu-13-10-13-04-12-04-linux-mint-16-15-13-and-debian-sid/
sudo add-apt-repository ppa:fcwu-tw/ppa
sudo aptitude update
sudo aptitude install vim

# install NeoBundle
if [ ! -d $HOME/.vim/bundle ]
then
  mkdir -p $HOME/.vim/bundle
fi
git clone git://github.com/Shougo/neobundle.vim $HOME/.vim/bundle/neobundle.vim

# execute :NeoBundleInstall in Vim command mode

# setup vimproc
cd $HOME/.vim/bundle/vimproc
make
