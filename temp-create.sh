#!/bin/bash

cd /home/pi/Projects/Pingomatic/log

/usr/bin/rrdtool create temp.rrd \
--step 60 \
DS:temp:GAUGE:120:0:100 \
		 RRA:MAX:0.5:1:1500 

# $rrdtool update latency_db.rrd --template pl:rtt N:$RETURN_DATA
