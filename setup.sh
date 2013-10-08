sudo aptitude update
sudo aptitude safe-upgrade
sudo aptitude install zsh vim tmux git tig curl build-essential
chsh -s /usr/bin/zsh

# get dotfiles
git clone https://github.com/kaosf/dotfiles $HOME/dotfiles
cd $HOME/dotfiles && ./setup

# logout
# login

touch $HOME/.zshenv && chmod 600 $HOME/.zshenv

# for local install
mkdir -p $HOME/local/src
mkdir -p $HOME/local/bin
echo 'export PATH=$HOME/local/bin:$PATH' >> $HOME/.zshenv

# install SQLite3
sudo aptitude install sqlite3 libsqlite3-dev

# dmd
cd ~/local/src
wget https://github.com/downloads/D-Programming-Language/dmd/dmd.2.059.zip
sudo aptitude install unzip
unzip dmd.2.059.zip
mv dmd2 ~/local/bin
echo "export PATH=$HOME/local/bin/dmd2/linux/bin64:$PATH" >> ~/.zshenv

# subversion
sudo aptitude install subversion libapache2-svn
sudo vim /etc/apache2/mods-enabled/dav_svn.conf
...
+ <Location /svn>
+         DAV svn
+         SVNParentPath /var/www/svn
+         AuthType Basic
+         AuthName "Subversion Repository"
+         AuthUserFile /var/www/svn/.htpasswd
+         AuthzSVNAccessFile /var/www/svn/.svnaccess
+         Require valid-user
+ </Location>

cd /var/www
sudo mkdir svn
sudo chown www-data:www-data svn
sudo vim .svnaccess
+ [myrepos:/]
+ ka = rw
+ someone = r
+ * =

sudo htpasswd -cm .htpasswd ka
sudo htpasswd -m .htpasswd someone
sudo svnadmin create myrepos
sudo svnadmin load myrepos < dumpfile # svnadmin dump myrepos > dumpfile # on somewhere
sudo chown -R www-data:www-data myrepos

# hg
sudo aptitude install mercurial

# HandBrakeCLI
# ref. https://launchpad.net/~stebbins/+archive/handbrake-releases
sudo aptitude install python-software-properties # for "add-apt-repository"
sudo add-apt-repository ppa:stebbins/handbrake-releases
sudo aptitude update
sudo aptitude install handbrake-cli

# Lua
cd $HOME/local/src
wget http://www.lua.org/ftp/lua-5.2.0.tar.gz
tar xzf lua-5.2.0.tar.gz
cd lua-5.2.0
vim Makefile
...
- PLAT= none
+ PLAT= linux
...
- INSTALL_TOP= /usr/local
+ INSTALL_TOP= /home/ka/local
...

make
make install

# Java6
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java6-installer

# samba
sudo aptitude install smbfs # 12.04
sudo aptitude install cifs-utils # 13.04
