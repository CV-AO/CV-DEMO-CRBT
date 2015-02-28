#!/bin/sh
cd /var/www/html/public/
php clipvoice.php
/home/kumagai/julius-4.3.1/julius/julius -C /home/kumagai/dictation-kit-v4.3.1-linux/main.jconf -C /home/kumagai/dictation-kit-v4.3.1-linux/am-gmm.jconf -filelist /home/kumagai/dictation-kit-v4.3.1-linux/filelist.txt -demo -charconv utf-8 utf-8 -outfile
sleep 30
php fb.php
