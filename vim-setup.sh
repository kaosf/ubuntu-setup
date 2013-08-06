# install pathogen
# ref. https://github.com/tpope/vim-pathogen/
mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/bundle
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
git clone https://github.com/Shougo/neocomplcache.git --depth 1
# NERDtree
#  ref. https://github.com/scrooloose/nerdtree
git clone https://github.com/scrooloose/nerdtree.git --depth 1
# vim-rails
#  ref. https://github.com/tpope/vim-rails
git clone git://github.com/tpope/vim-rails.git --depth 1
# vim-coffee-script
#  ref. https://github.com/kchmck/vim-coffee-script/
git clone https://github.com/kchmck/vim-coffee-script.git --depth 1
# vim-ls
#  ref. https://github.com/gkz/vim-ls
#       http://d.hatena.ne.jp/mizchi/20120706/1341568588
git clone git://github.com/gkz/vim-ls.git --depth 1
# titanium-vim
#  ref. http://d.hatena.ne.jp/gabuchan/20110930/1317374566
git clone https://github.com/pekepeke/titanium-vim.git --depth 1
# neco-ruby-keyword-args
#  ref. http://qiita.com/items/b8dd37efa64a9054c048
git clone git://github.com/rhysd/neco-ruby-keyword-args.git --depth 1
# jade-vim
#  ref. https://github.com/digitaltoad/vim-jade
git clone https://github.com/digitaltoad/vim-jade.git --depth 1
# typescript-vim
#  ref. https://github.com/leafgarland/typescript-vim
git clone https://github.com/leafgarland/typescript-vim.git --depth 1
# Groovy
#  ref. https://github.com/vim-scripts/groovy.vim
git clone https://github.com/vim-scripts/groovy.vim --depth 1
# Stylus
#  ref. https://github.com/wavded/vim-stylus
git clone https://github.com/wavded/vim-stylus --depth 1
# vim-quickrun
#  ref. https://github.com/thinca/vim-quickrun
#       http://d.hatena.ne.jp/osyo-manga/20130311/1363012363
git clone https://github.com/thinca/vim-quickrun --depth 1
# vim-markdown-quote-syntax
# ref. https://github.com/joker1007/vim-markdown-quote-syntax
git clone https://github.com/joker1007/vim-markdown-quote-syntax --depth 1
# vim-ft-clojure
# ref. http://d.hatena.ne.jp/thinca/20120915/1347696749
#      https://github.com/thinca/vim-ft-clojure
git clone https://github.com/thinca/vim-ft-clojure --depth 1
