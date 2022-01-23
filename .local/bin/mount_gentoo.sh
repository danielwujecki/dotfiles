#!/usr/bin/env bash
set -euo pipefail

MNTPNT="/mnt/gentoo"
BLKDEV="/dev/vgsys/gentoo_root"

if [[ ! -d $MNTPNT ]] ; then
    echo "$MNTPNT not found."
    exit 1
fi

if [[ ! -b $BLKDEV ]] ; then
    echo "$BLKDEV not found."
    exit 1
fi

mount -o noatime,compress=zstd:2,ssd,subvol=@          "$BLKDEV" "$MNTPNT"            && echo "@"
mount -o noatime,compress=zstd:2,ssd,subvol=@cache     "$BLKDEV" "$MNTPNT/var/cache"  && echo "@cache"
mount -o noatime,compress=zstd:2,ssd,subvol=@db        "$BLKDEV" "$MNTPNT/var/db"     && echo "@db"
mount -o noatime,compress=zstd:2,ssd,subvol=@home      "$BLKDEV" "$MNTPNT/home"       && echo "@home"
mount -o noatime,compress=zstd:2,ssd,subvol=@snapshots "$BLKDEV" "$MNTPNT/.snapshots" && echo "@snapshots"
mount -o noatime,compress=zstd:2,ssd,subvol=@src       "$BLKDEV" "$MNTPNT/usr/src"    && echo "@src"
mount -o noatime,compress=zstd:2,ssd,subvolid=5        "$BLKDEV" "$MNTPNT/.btrfs"     && echo "subvolid=5"
mount /dev/sda "$MNTPNT/boot"

cp --dereference /etc/resolv.conf "$MNTPNT/etc/"
mount --types proc /proc "$MNTPNT/proc" && echo "proc"
mount --rbind /sys       "$MNTPNT/sys"
mount --make-rslave      "$MNTPNT/sys"  && echo "sys"
mount --rbind /dev       "$MNTPNT/dev"
mount --make-rslave      "$MNTPNT/dev"  && echo "dev"
mount --bind /run        "$MNTPNT/run"
mount --make-slave       "$MNTPNT/run"

echo "done"
