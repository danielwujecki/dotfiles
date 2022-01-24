#!/bin/bash
set -euo pipefail

help() {
    echo "usage: ./build_initramfs.sh [-o <filename>] [--kernel <version>] [--dracut|--find]"
}

setup_manual() {
    # directory structure
    rm -rf dest
    mkdir -p dest/dev dest/etc/lvm dest/mnt dest/proc dest/run dest/sys dest/tmp dest/usr/bin dest/usr/lib
    cd dest

    # symlinks
    ln -s usr/bin bin
    ln -s usr/bin sbin
    ln -s bin usr/sbin
    ln -s usr/lib lib
    ln -s usr/lib lib64
    ln -s lib usr/lib64

    # nodes
    cp --archive /dev/console dev
    cp --archive /dev/tty dev
    cp --archive /dev/null dev
    cp --archive /dev/urandom dev
    cp --archive /dev/random dev

    # binaries
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

    # lvm added deps
    cp /lib64/libaio.so.1 usr/lib
    cp /lib64/libreadline.so.8 usr/lib
    cp /lib64/libtinfow.so.6 usr/lib
    cp /lib64/libdevmapper-event.so.1.02 usr/lib

    # config files
    cp ../lvm.conf etc/lvm

    # init script
    cp ../init .
    chmod 755 init

    cd ..
}

KERVER=""; OUTPUT=""
DRACUT=""; FIND=""

while [[ $# -gt 0 ]] ; do
    case "$1" in
        -o)
            OUTPUT="$2"
            shift 2
            ;;
        --kernel)
            KERVER="$2"
            shift 2
            ;;
        --dracut)
            DRACUT="yes"
            if [[ -n $FIND ]] ; then
                help
                exit 1
            fi
            shift
            ;;
        --find)
            FIND="yes"
            if [[ -n $DRACUT ]] ; then
                help
                exit 1
            fi
            shift
            ;;
        --help)
            help
            exit 0
            ;;
    esac
done

if [[ -z $KERVER ]] ; then
    KERVER="$(ls /boot | grep 'vmlinuz' | sort | tail -n1 | sed 's/vmlinuz-//')"
elif [[ -z $(ls /boot | egrep ^vmlinuz-"$KERVER"\$) ]] ; then
    echo "Invalid kernel version. Available Kernel versions:"
    ls /boot | grep 'vmlinuz' | sed 's/vmlinuz-//g'
    help
    exit 1
fi
if [[ -z $OUTPUT ]] ; then
    OUTPUT="/boot/initramfs-$KERVER.img"
fi

GCCVER="$(equery l gcc | grep 'sys-devel/gcc' | sed 's/sys-devel\/gcc-//')"

sed "s/gcc\/x86_64-pc-linux-gnu\/[0-9.]\+\//gcc\/x86_64-pc-linux-gnu\/$GCCVER\//g" initramfs.list > initramfs.list.tmp
mv initramfs.list.tmp initramfs.list

sed 's/use_lvmetad = 1/use_lvmetad = 0/' /etc/lvm/lvm.conf > lvm.conf

if [[ -n $DRACUT ]] ; then
    dracut --hostonly --zstd "$OUTPUT" "$KERVER"
elif [[ -n $FIND ]] ; then
    setup_manual
    find . -print0 | cpio -o0vH newc | zstd > "$OUTPUT"
    echo -e "\nConsider 'rm -r ./dest'\n"
else
    /usr/src/linux/usr/gen_init_cpio /usr/src/initramfs/initramfs.list | zstd > "$OUTPUT"
fi

echo "Written to $OUTPUT."
