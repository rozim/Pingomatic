#!/bin/bash

cd /home/pi/log

/usr/bin/rrdtool create uptime.rrd \
--step 60 \
		 DS:load1:GAUGE:120:0:100 \
		 DS:load5:GAUGE:120:0:100 \
		 DS:load15:GAUGE:120:0:100 \
                 DS:max:GAUGE:120:0:1000 \
                 RRA:MAX:0.5:1:1500 

# $rrdtool update latency_db.rrd --template pl:rtt N:$RETURN_DATA
