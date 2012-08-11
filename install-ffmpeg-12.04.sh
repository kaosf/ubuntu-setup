# ref. http://ffmpeg.org/trac/ffmpeg/wiki/UbuntuCompilationGuide

### Preparation

sudo aptitude purge ffmpeg x264 libav-tools libvpx-dev libx264-dev
sudo aptitude update
sudo aptitude install build-essential checkinstall git libfaac-dev libgpac-dev \
  libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev librtmp-dev libtheora-dev \
  libvorbis-dev pkg-config texi2html yasm zlib1g-dev

### Installation

## x264

cd $HOME/local/src
git clone --depth 1 git://git.videolan.org/x264
cd x264
./configure --enable-static
make
sudo checkinstall --pkgname=x264 --pkgversion="3:$(./version.sh | \
  awk -F'[" ]' '/POINT/{print $4"+git"$5}')" --backup=no --deldoc=yes \
  --fstrans=no --default
# sudo dpkg -r x264 # to uninstall

## libfdk-aac

cd $HOME/local/src
wget http://downloads.sourceforge.net/opencore-amr/fdk-aac-0.1.0.tar.gz
tar xzvf fdk-aac-0.1.0.tar.gz
cd fdk-aac-0.1.0
./configure
make
sudo checkinstall --pkgname=fdk-aac --pkgversion="0.1.0" --backup=no \
  --deldoc=yes --fstrans=no --default
# sudo dpkg -r fdk-aac # to uninstall

## libvpx

cd $HOME/local/src
git clone --depth 1 http://git.chromium.org/webm/libvpx.git
cd libvpx
./configure
make
sudo checkinstall --pkgname=libvpx --pkgversion="1:$(date +%Y%m%d%H%M)-git" --backup=no \
  --deldoc=yes --fstrans=no --default
# sudo dpkg -r libvpx # to uninstall

## FFmpeg

cd $HOME/local/src
git clone --depth 1 git://source.ffmpeg.org/ffmpeg
cd ffmpeg
# omit --enable-x11grab
./configure --enable-gpl --enable-libfaac --enable-libmp3lame --enable-libopencore-amrnb \
  --enable-libopencore-amrwb --enable-librtmp --enable-libtheora --enable-libvorbis \
  --enable-libvpx --enable-libx264 --enable-nonfree --enable-version3
make
sudo checkinstall --pkgname=ffmpeg --pkgversion="5:$(date +%Y%m%d%H%M)-git" --backup=no \
  --deldoc=yes --fstrans=no --default
hash x264 ffmpeg ffplay ffprobe 
# sudo dpkg -r ffmpeg # to uninstall

### Optional Installation

## qt-faststart

cd $HOME/local/src/ffmpeg
make tools/qt-faststart
sudo checkinstall --pkgname=qt-faststart --pkgversion="$(date +%Y%m%d%H%M)-git" --backup=no \
  --deldoc=yes --fstrans=no --default install -Dm755 tools/qt-faststart \
  /usr/local/bin/qt-faststart
# sudo dpkg -r qt-faststart # to uninstall
