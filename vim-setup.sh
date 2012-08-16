# install pathogen
# ref. https://github.com/tpope/vim-pathogen/
mkdir -p ~/.vim/{autoload,bundle}
cd ~/.vim/autoload
curl -so ~/.vim/autoload/pathogen.vim \
  https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

# copy or make symbolic link of .vimrc from dotfiles

# install vim plugins
cd ~/.vim/bundle
# neocomplcache
#  ref. http://vim-users.jp/2010/10/hack177/
#       http://vim-users.jp/2010/11/hack185/
#       http://vim-users.jp/2011/01/hack193/
#       http://d.hatena.ne.jp/gabuchan/20110930/1317374566
git clone https://github.com/Shougo/neocomplcache.git
# NERDtree
#  ref. https://github.com/scrooloose/nerdtree
git clone https://github.com/scrooloose/nerdtree.git
# vim-rails
#  ref. https://github.com/tpope/vim-rails
git clone git://github.com/tpope/vim-rails.git
# vim-coffee-script
#  ref. https://github.com/kchmck/vim-coffee-script/
git clone https://github.com/kchmck/vim-coffee-script.git
# vim-ls
#  ref. https://github.com/gkz/vim-ls
#       http://d.hatena.ne.jp/mizchi/20120706/1341568588
git clone git://github.com/gkz/vim-ls.git
# titanium-vim
#  ref. http://d.hatena.ne.jp/gabuchan/20110930/1317374566
git clone https://github.com/pekepeke/titanium-vim.git
