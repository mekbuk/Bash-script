#!/bin/sh

# Directory to store log files in
DST=/root/logs

# Any logs older than this will be deleted first
KEEPDAYS=14

# Create DST if it doesn't exist
if [ ! -d "$DST" ]; then
  mkdir $DST
fi

# Remove logs older than KEEPDAYS in DST
find ${DST} -type f -mtime +${KEEPDAYS} -exec rm -f {} \;

# Find files over 150MB
find /home -iname \*.mp3 -o -iname \*.mp4 -o -iname \*.avi -o -iname \*.mpg -o -iname \*.flv -o -iname -o -iname \*.iso -o -iname \*.rar -o -iname \*.mpeg > ${DST}/files_bad_extensions-`date +%F`.txt
