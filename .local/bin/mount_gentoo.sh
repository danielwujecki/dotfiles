#!/usr/bin/env bash
set -euo pipefail

MNTPNT="/mnt/gentoo"
BLKDEV="/dev/vgsys/gentoo_root"
BOOTDEV="/dev/nvme0n1p1"

if [[ ! -d $MNTPNT ]] ; then
    echo "$MNTPNT not found."
    exit 1
fi

if [[ ! -b $BLKDEV ]] ; then
    echo "$BLKDEV not found."
    exit 1
fi

mount -o noatime,compress=zstd:2,ssd,space_cache=v2,subvol=@          "$BLKDEV" "$MNTPNT"            && echo "@"
mount -o noatime,compress=zstd:2,ssd,space_cache=v2,subvol=@home      "$BLKDEV" "$MNTPNT/home"       && echo "@home"
mount -o noatime,compress=zstd:2,ssd,space_cache=v2,subvol=@cache     "$BLKDEV" "$MNTPNT/var/cache"  && echo "@cache"
mount -o noatime,compress=zstd:2,ssd,space_cache=v2,subvol=@snapshots "$BLKDEV" "$MNTPNT/.snapshots" && echo "@snapshots"
mount -o noatime,compress=zstd:2,ssd,space_cache=v2,subvolid=5        "$BLKDEV" "$MNTPNT/.btrfs"     && echo "subvolid=5"
mount "$BOOTDEV" "$MNTPNT/boot"

cp --dereference /etc/resolv.conf "$MNTPNT/etc/"
mount --types proc /proc "$MNTPNT/proc" && echo "proc"
mount --rbind /sys       "$MNTPNT/sys"
mount --make-rslave      "$MNTPNT/sys"  && echo "sys"
mount --rbind /dev       "$MNTPNT/dev"
mount --make-rslave      "$MNTPNT/dev"  && echo "dev"
mount --bind /run        "$MNTPNT/run"
mount --make-slave       "$MNTPNT/run"  && echo "run"

echo "done"
