#!/bin/bash

cd /home/pi/log

/usr/bin/rrdtool create ping.rrd \
--step 60 \
DS:received:GAUGE:120:0:10 \
DS:max:GAUGE:120:0:1000 \
		 RRA:MAX:0.5:1:1500 

# $rrdtool update latency_db.rrd --template pl:rtt N:$RETURN_DATA
