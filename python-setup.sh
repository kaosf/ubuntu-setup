sudo aptitude install python-pip

# ref. https://bitbucket.org/mgemmill/bitbucket-cli
sudo pip install bitbucket-cli
echo '[auth]'              > $HOME/.bitbucket
echo 'username = kaosf'    >> $HOME/.bitbucket
echo 'password = ********' >> $HOME/.bitbucket
echo '[options]'           >> $HOME/.bitbucket
echo 'scm = git'           >> $HOME/.bitbucket
echo 'protocol = ssh'      >> $HOME/.bitbucket
chmod 600 $HOME/.bitbucket

# ref. https://asciinema.org/docs
sudo pip install --upgrade asciinema
