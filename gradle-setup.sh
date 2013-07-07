# ref. http://itpro.nikkeibp.co.jp/article/COLUMN/20130517/477648/?ST=android-dev

# install gvm
# ref. http://gvmtool.net/
curl -s get.gvmtool.net | bash

source $HOME/.gvm/bin/gvm-init.sh
echo 'source "$HOME/.gvm/bin/gvm-init.sh"' >> $HOME/.zshenv

gvm install gradle
# set as a default
