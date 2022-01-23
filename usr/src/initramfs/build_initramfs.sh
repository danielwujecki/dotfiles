#!/bin/bash
set -euo pipefail

KERVER="$(ls /boot | grep 'vmlinuz' | sed 's/vmlinuz-//')"
GCCVER="$(equery l gcc | grep 'sys-devel/gcc' | sed 's/sys-devel\/gcc-//')"

rm -rf dest
mkdir -p dest/dev dest/etc dest/mnt dest/proc dest/run dest/sys dest/tmp dest/usr/bin "dest/usr/lib/modules/$KERVER"

cd dest
ln -s usr/bin bin
ln -s usr/bin sbin
ln -s bin usr/sbin
ln -s usr/lib lib
ln -s usr/lib lib64
ln -s lib usr/lib64

cp ../init .
chmod +x init

cp /bin/busybox usr/bin
cp /sbin/cryptsetup usr/bin
cp /sbin/lvm usr/bin

# cryptsetup deps
cp /usr/lib64/libcryptsetup.so.12 usr/lib
cp /usr/lib64/libpopt.so.0 usr/lib
cp /lib64/libuuid.so.1 usr/lib
cp /lib64/libblkid.so.1 usr/lib
cp /lib64/libc.so.6 usr/lib
cp /lib64/libdevmapper.so.1.02 usr/lib
cp /usr/lib64/libcrypto.so.1.1 usr/lib
cp /usr/lib64/libargon2.so.1 usr/lib
cp /usr/lib64/libjson-c.so.5 usr/lib
cp /lib64/ld-linux-x86-64.so.2 usr/lib
cp /lib64/libudev.so.1 usr/lib
cp /lib64/libpthread.so.0 usr/lib
cp /lib64/libm.so.6 usr/lib
cp /lib64/libdl.so.2 usr/lib
cp /lib64/librt.so.1 usr/lib
cp "/usr/lib/gcc/x86_64-pc-linux-gnu/$GCCVER/libgcc_s.so.1" usr/lib
# lvm deps
cp /lib64/libaio.so.1 usr/lib
cp /lib64/libreadline.so.8 usr/lib
cp /lib64/libtinfow.so.6 usr/lib
cp /lib64/libdevmapper-event.so.1.02 usr/lib

cp -r /etc/modprobe.d etc
cp -r /lib/modprobe.d usr/lib

cp /lib/modules/"$KERVER"/modules.* "usr/lib/modules/$KERVER"
cp -r "/lib/modules/$KERVER/kernel" "usr/lib/modules/$KERVER"

find . -print0 | cpio -o0vH newc | zstd > "/boot/initramfs-$KERVER.img"
# dracut --hostonly --zstd /boot/initramfs-5.15.16-gentoo.img "$KERVER"
