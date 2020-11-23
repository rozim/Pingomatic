#!/bin/bash

cd /home/pi/log

/usr/bin/rrdtool graph /var/www/html/pingomatic/temp.png \
-w 785 -h 120 -a PNG \
--slope-mode \
--start -86400 --end now \
--font DEFAULT:7: \
--title "temperature" \
--vertical-label "(C)" \
--lower-limit 0 \
--right-axis 1:0 \
--x-grid MINUTE:10:HOUR:1:MINUTE:120:0:%R \
--alt-y-grid --rigid \
		 DEF:temp=temp.rrd:temp:MAX \
		 LINE1:temp#0000FF:"" \
		 GPRINT:temp:LAST:"Cur\: %5.2lf"
