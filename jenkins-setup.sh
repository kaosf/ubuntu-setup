# ref. http://pkg.jenkins-ci.org/debian/
wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
echo "deb http://pkg.jenkins-ci.org/debian binary/" | sudo tee -a /etc/apt/sources.list
sudo apt-get update
sudo apt-get -y install jenkins
