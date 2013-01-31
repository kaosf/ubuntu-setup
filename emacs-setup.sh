sudo aptitude install emacs

# ref. http://d.hatena.ne.jp/tomoya/20090121/1232536106
if [ ! -d $HOME/.emacs.d/elisp ]; then
  mkdir -p $HOME/.emacs.d/elisp
fi
cd $HOME/.emacs.d/elisp
wget http://www.emacswiki.org/cgi-bin/wiki/download/install-elisp.el
