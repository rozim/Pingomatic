#!/bin/bash

cd /home/pi/log
/usr/bin/rrdtool graph /var/www/html/pingomatic/ping.png \
-w 785 -h 120 -a PNG \
--slope-mode \
--start -86400 --end now \
--font DEFAULT:7: \
--title "ping 8.8.8.8" \
--watermark "`date`" \
--vertical-label "latency(ms)" \
--right-axis-label "latency(ms)" \
--lower-limit 0 \
--right-axis 1:0 \
--x-grid MINUTE:10:HOUR:1:MINUTE:120:0:%R \
                 --alt-y-grid \
                 --rigid \
DEF:roundtrip=ping.rrd:max:MAX \
DEF:packetloss=ping.rrd:received:MAX \
CDEF:PLNone=packetloss,0,0,LIMIT,UN,UNKN,INF,IF \
CDEF:PL10=packetloss,1,10,LIMIT,UN,UNKN,INF,IF \
CDEF:PL25=packetloss,10,25,LIMIT,UN,UNKN,INF,IF \
CDEF:PL50=packetloss,25,50,LIMIT,UN,UNKN,INF,IF \
CDEF:PL100=packetloss,50,100,LIMIT,UN,UNKN,INF,IF \
LINE1:roundtrip#0000FF:"latency(ms)" \
GPRINT:roundtrip:LAST:"Cur\: %5.2lf" \
GPRINT:roundtrip:AVERAGE:"Avg\: %5.2lf" \
GPRINT:roundtrip:MAX:"Max\: %5.2lf" \
GPRINT:roundtrip:MIN:"Min\: %5.2lf\t\t\t" \
COMMENT:"pkt loss\:" \
AREA:PLNone#FFFFFF:"0%":STACK \
AREA:PL10#FFFF00:"1-10%":STACK \
AREA:PL25#FFCC00:"10-25%":STACK \
AREA:PL50#FF8000:"25-50%":STACK \
AREA:PL100#FF0000:"50-100%":STACK

############################################################

/usr/bin/rrdtool graph /var/www/html/pingomatic/ping-large.png \
-w 785 -h 480 -a PNG \
--slope-mode \
                 --start -86400 \
                 --end now \
--font DEFAULT:7: \
--title "ping 8.8.8.8" \
--watermark "`date`" \
--vertical-label "latency(ms)" \
--right-axis-label "latency(ms)" \
--lower-limit 0 \
--right-axis 1:0 \
--x-grid MINUTE:10:HOUR:1:MINUTE:120:0:%R \
                 --alt-y-grid \
                 --rigid \
DEF:roundtrip=ping.rrd:max:MAX \
DEF:packetloss=ping.rrd:received:MAX \
CDEF:PLNone=packetloss,0,0,LIMIT,UN,UNKN,INF,IF \
CDEF:PL10=packetloss,1,10,LIMIT,UN,UNKN,INF,IF \
CDEF:PL25=packetloss,10,25,LIMIT,UN,UNKN,INF,IF \
CDEF:PL50=packetloss,25,50,LIMIT,UN,UNKN,INF,IF \
CDEF:PL100=packetloss,50,100,LIMIT,UN,UNKN,INF,IF \
LINE1:roundtrip#0000FF:"latency(ms)" \
GPRINT:roundtrip:LAST:"Cur\: %5.2lf" \
GPRINT:roundtrip:AVERAGE:"Avg\: %5.2lf" \
GPRINT:roundtrip:MAX:"Max\: %5.2lf" \
GPRINT:roundtrip:MIN:"Min\: %5.2lf\t\t\t" \
COMMENT:"pkt loss\:" \
AREA:PLNone#FFFFFF:"0%":STACK \
AREA:PL10#FFFF00:"1-10%":STACK \
AREA:PL25#FFCC00:"10-25%":STACK \
AREA:PL50#FF8000:"25-50%":STACK \
AREA:PL100#FF0000:"50-100%":STACK



