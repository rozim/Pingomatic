#!/bin/bash

cd /home/pi/log

out=$(head -1 /proc/loadavg)

load1=$(echo $out | cut -f1 -d" ")
load5=$(echo $out | cut -f2 -d" ")
load15=$(echo $out | cut -f3 -d" ")

/usr/bin/rrdtool update uptime.rrd --template load1:load5:load15 N:${load1}:${load5}:${load15}



