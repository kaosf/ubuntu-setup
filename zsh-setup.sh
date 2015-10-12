# sudo apt-get -y install
git clone https://github.com/zsh-users/zsh
cd zsh
git checkout zsh-5.1.1
./Util/preconfig
./configure --prefix=/usr/local --enable-multibyte --with-tcsetpgrp
make clean
make
sudo make install; [ $? = 2 ]
cd -
sudo mv zsh /usr/local/src
echo '/usr/local/bin/zsh' | sudo tee -a /etc/shells
