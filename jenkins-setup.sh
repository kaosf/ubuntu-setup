# ref. http://pkg.jenkins-ci.org/debian/
wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
echo "deb http://pkg.jenkins-ci.org/debian binary/" | sudo tee -a /etc/apt/sources.list
sudo aptitude update
sudo aptitude install jenkins
