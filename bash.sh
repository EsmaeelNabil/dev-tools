#!/usr/bin/env bash

file_name="screen-$2.png"
adb -s "$1" shell screencap -p /sdcard/screen.png
adb -s "$1" pull /sdcard/screen.png ~/Desktop/screen.png
mv ~/Desktop/screen.png ~/Desktop/$file_name
echo "Screenshot saved to ~/Desktop/$file_name"
