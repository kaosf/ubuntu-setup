# install NeoBundle
if [ ! -d $HOME/.vim/bundle ]
then
  mkdir -p $HOME/.vim/bundle
fi
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
