#!/bin/bash

temp=$(/opt/vc/bin/vcgencmd measure_temp | sed -e s/temp=//g | sed -e "s/'C//g")

cd /home/pi/Projects/Pingomatic/log

echo $temp > temp-last.txt


/usr/bin/rrdtool update temp.rrd --template temp N:${temp}



