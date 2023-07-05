#!/bin/sh

### ===== CPU =====

### ===== MEM =====

### ===== DISK =====
# gather disk information
echo "##### disk usage #####" > /root/thresholdchecks_disk/files/disk_output.txt
output=($(lsblk | awk '{print $7}' | tail --lines=+2 | grep -Ev "^#|^$" | sed -e 's/^\///; s/$/\//' -e 's/\[SWAP\]\///' | grep -Ev "^#|^$"))
# loop through output
for entry in "${output[@]}";
do
  minor="%HOSTNAME%|__linux__us_ncpa-disk-${entry}-percent__minor__ = /disk/logical/|${entry}used_percent --critical 90"
  warning="%HOSTNAME%|__linux__us_ncpa-disk-${entry}-percent__warning__ = /disk/logical/|${entry}used_percent --critical @80:90"
  echo "# $entry"
  echo "$minor"
  echo "$warning"
done | sed -e 's/-\/-/-root-/; s/\///; s/\/-/-/' >> /root/thresholdchecks_disk/files/disk_output.txt
