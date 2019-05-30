#!/bin/bash
YMD=$(date '+%F')
YMDTZ=$(date '+%FT%H%M%SZ%z')
BASEDIR="/Users/cme/Desktop/screenshots"
DESTDIR="$BASEDIR/$YMD"
TMPFILE1=/tmp/screen1.png
TMPFILE2=/tmp/screen2.png
# clear out old data
rm -rf $BASEDIR/"$(date -v -7d '+%F')"

# take screenshots
mkdir -p $DESTDIR
/usr/sbin/screencapture -t png -x -D 1 "$TMPFILE1"
/usr/sbin/screencapture -t png -x -D 2 "$TMPFILE2"
# combine the screens
/usr/local/bin/convert "$TMPFILE1" "$TMPFILE2" -background opaque +append -resize 2500 "$DESTDIR/$YMDTZ".png
