#!/bin/bash
function  timeout(){
    timeStart=`date +%s`
    timeEnd=`date +%s`
    #echo "starttime is  $timeStart"
    #echo "endtiem is $timeEnd"
    i=$(($timeEnd - $timeStart))
    timeout=$1
    echo "timeout is :$timeout"

    while ([ $i -ne $timeout ])
        do
        timeEnd=`date +%s`
        i=$(($timeEnd - $timeStart))
        done
}
nvidia-smi -l 1 --format=csv --filename=$1 --query-gpu=timestamp,name,index,utilization.gpu,memory.total,memory.used,power.draw &
echo "shell  PID: $$"
echo "nvidia-smi  PID: $!"
id=$!
echo $id
timeout $2
echo $id
kill -9 "$id"