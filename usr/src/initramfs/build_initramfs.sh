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
    KERVER="$(ls /usr/src | grep 'linux-' | sort | tail -n1 | sed 's/linux-//')"
elif [[ -z $(ls /usr/src | egrep "^linux-$KERVER\$") ]] ; then
    echo "Invalid kernel version. Available Kernel versions:"
    ls /usr/src | grep 'linux-' | sed 's/linux-//g'
    help
    exit 1
fi
if [[ -z $OUTPUT ]] ; then
    OUTPUT="/boot/initramfs-$KERVER.img"
fi

gccver="$(eselect gcc show | sed 's/x86_64-pc-linux-gnu-//')"
sed "s|gcc/x86_64-pc-linux-gnu/.\+/|gcc/x86_64-pc-linux-gnu/$gccver/|g" /usr/src/initramfs/initramfs.list > /usr/src/initramfs/initramfs.list.tmp
mv /usr/src/initramfs/initramfs.list.tmp /usr/src/initramfs/initramfs.list
sed 's/use_lvmetad = 1/use_lvmetad = 0/' /etc/lvm/lvm.conf > /usr/src/initramfs/lvm.conf

if [[ -n $DRACUT ]] ; then
    dracut --hostonly --zstd "$OUTPUT" "$KERVER"
else
    /usr/src/linux/usr/gen_init_cpio /usr/src/initramfs/initramfs.list | zstd > "$OUTPUT"
fi

echo "Written to $OUTPUT."
