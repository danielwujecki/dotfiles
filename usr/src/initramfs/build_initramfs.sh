#!/bin/bash
set -euo pipefail

help() {
    echo "usage: ./build_initramfs.sh [-o <filename>] [--kernel <version>] [--dracut]"
}

KERVER=""; OUTPUT="" ; DRACUT=""

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
elif [[ -z $(ls /boot | egrep "^vmlinuz-$KERVER\$") ]] ; then
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
else
    /usr/src/linux/usr/gen_init_cpio /usr/src/initramfs/initramfs.list | zstd > "$OUTPUT"
fi

echo "Written to $OUTPUT."
