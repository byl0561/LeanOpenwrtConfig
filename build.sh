git clone https://github.com/coolsnowwolf/openwrt.git
cp ./defconfig ./openwrt/defconfig

cd openwrt

./scripts/feeds update -a
./scripts/feeds install -a

cat defconfig >> .config
make defconfig

make -j8 download V=s
make -j1 V=s

cp -r ./bin/targets ../targets

make distclean
cd ..