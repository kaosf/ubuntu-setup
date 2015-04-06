# Java 7
sudo aptitude install openjdk-7-jdk

# Oracle Java 8
# ref. http://askubuntu.com/questions/464755/how-to-install-openjdk-8-on-14-04-lts
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer oracle-java8-set-default

# switch java/javac
sudo update-alternatives --config java
sudo update-alternatives --config javac
