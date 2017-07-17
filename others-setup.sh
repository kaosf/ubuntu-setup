# install SQLite3
sudo apt-get -y install sqlite3 libsqlite3-dev

# dmd
cd ~/local/src
wget https://github.com/downloads/D-Programming-Language/dmd/dmd.2.059.zip
sudo apt-get -y install unzip
unzip dmd.2.059.zip
mv dmd2 ~/local/bin
echo "export PATH=$HOME/local/bin/dmd2/linux/bin64:$PATH" >> ~/.zshenv

# subversion
sudo apt-get -y install subversion libapache2-svn
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
sudo apt-get -y install mercurial

# HandBrakeCLI
# ref. https://launchpad.net/~stebbins/+archive/handbrake-releases
#sudo apt-get -y install python-software-properties # for "add-apt-repository"
sudo apt-get -y install software-properties-common # for "add-apt-repository"
sudo add-apt-repository ppa:stebbins/handbrake-releases
sudo apt-get update
sudo apt-get -y install handbrake-cli

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
