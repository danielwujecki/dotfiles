#!/bin/bash -e

MNTPNT="/mnt/gentoo"
BLKDEV="/dev/sda2"

if [[ ! -d $MNTPNT ]] ; then
    echo "$MNTPNT not found."
    exit 1
fi

if [[ ! -b $BLKDEV ]] ; then
    echo "$BLKDEV not found."
    exit 1
fi

mount -o noatime,compress=zstd:2,space_cache,ssd,subvol=@gen-root  "$BLKDEV" "$MNTPNT"              && echo "@gen-root"
mount -o noatime,compress=zstd:2,space_cache,ssd,subvol=@gen-cache "$BLKDEV" "$MNTPNT/var/cache"    && echo "@gen-cache"
mount -o noatime,compress=zstd:2,space_cache,ssd,subvol=@gen-db    "$BLKDEV" "$MNTPNT/var/db"       && echo "@gen-db"
mount -o noatime,compress=zstd:2,space_cache,ssd,subvol=@gen-home  "$BLKDEV" "$MNTPNT/home"         && echo "@gen-home"
mount -o noatime,compress=zstd:2,space_cache,ssd,subvol=@gen-src   "$BLKDEV" "$MNTPNT/usr/src"      && echo "@gen-src"
mount -o noatime,compress=zstd:2,space_cache,ssd,subvol=@snap      "$BLKDEV" "$MNTPNT/.snapshots"   && echo "@snap"
mount -o noatime,compress=zstd:2,space_cache,ssd,subvolid=5        "$BLKDEV" "$MNTPNT/.btrfs"       && echo "subvolid=5"
mount /dev/sda1 "$MNTPNT/boot"

mount --types proc /proc /mnt/gentoo/proc && echo "proc"
mount --rbind /sys /mnt/gentoo/sys
mount --make-rslave /mnt/gentoo/sys && echo "sys"
mount --rbind /dev /mnt/gentoo/dev
mount --make-rslave /mnt/gentoo/dev && echo "dev"

echo "done"
