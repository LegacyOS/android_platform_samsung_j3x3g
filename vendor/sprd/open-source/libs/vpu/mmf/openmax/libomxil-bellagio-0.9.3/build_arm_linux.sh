autoreconf -i -f
./configure --prefix=$ROOTFS_DIR/usr --host=arm-none-linux-gnueabi CFLAGS=-I$ROOTFS_DIR/usr/include LDFLAGS=-L$ROOTFS_DIR/usr/lib 
echo export OMX_BELLAGIO_REGISTRY=$HOME/vpu/mmf/openmax/out/.omxregister >> $HOME/.profile
echo export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$HOME/vpu/mmf/openmax/out/lib/pkgconfig  >> $HOME/.profile
source ~/.profile



