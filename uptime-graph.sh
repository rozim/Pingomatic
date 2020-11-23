#!/bin/bash

cd /home/pi/log

/usr/bin/rrdtool graph /var/www/html/pingomatic/uptime.png \
-w 785 -h 120 -a PNG \
--slope-mode \
--start -86400 --end now \
--font DEFAULT:7: \
--title "load average" \
--vertical-label "load" \
--lower-limit 0 \
--right-axis 1:0 \
--x-grid MINUTE:10:HOUR:1:MINUTE:120:0:%R \
--alt-y-grid --rigid \
		 DEF:load1=uptime.rrd:load1:MAX \
		 DEF:load5=uptime.rrd:load5:MAX \
		 DEF:load15=uptime.rrd:load15:MAX \
		 LINE1:load1#0000FF:"" \
		 LINE1:load5#0000FF:"" \
		 LINE1:load15#0000FF:"" \
		 GPRINT:load1:LAST:"Cur\: %5.2lf"
