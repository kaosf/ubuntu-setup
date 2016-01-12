mkdir PAPI
cd PAPI
wget http://icl.cs.utk.edu/projects/papi/downloads/papi-5.4.1.tar.gz --no-check-certificate
cd papi-5.4.1
./configure
make
sudo make install
cd ../
