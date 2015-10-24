chown -R root /Users/Zheng/Projects/VolumeNotifier/Products
rm -rf /Users/Zheng/Projects/VolumeNotifier/Products/*
chmod -R 0755 /Users/Zheng/Projects/VolumeNotifier/Products
sudo find /Users/Zheng/Projects/VolumeNotifier/Products -name ".DS_Store" -depth -exec rm {} \;
dpkg -e /Users/Zheng/Projects/VolumeNotifier/Packages/*.deb /Users/Zheng/Projects/VolumeNotifier/Products/DEBIAN
dpkg -x /Users/Zheng/Projects/VolumeNotifier/Packages/*.deb /Users/Zheng/Projects/VolumeNotifier/Products
dpkg -x /Users/Zheng/Projects/VolumeNotifier/VolumeNotifierPrefs/Packages/*.deb /Users/Zheng/Projects/VolumeNotifier/Products
dpkg-deb -Z lzma -b /Users/Zheng/Projects/VolumeNotifier/Products /Users/Zheng/Projects/VolumeNotifier/com.darwindev.VolumeNotifier_0.3-4_iphoneos-arm.deb
