#!/bin/bash

ping="/bin/ping -c 10 -n -q"
target="8.8.8.8"
command="${ping} ${target}"
out=/tmp/$$

trap "rm -f ${out}" EXIT

${command} > ${out}

received=$(grep transmitted ${out} |  cut --fields=2 -d, | cut --fields=2 -d" ")
max=$(grep "rtt min/avg/max/mdev" ${out} | cut --fields=6 -d /)

cd /home/pi/log
cp ${out} last.txt
echo received=${received} >> last.txt
echo max=${max} >> last.txt

/usr/bin/rrdtool update ping.rrd --template received:max N:${received}:${max}



