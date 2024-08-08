#!/bin/bash

logFile="./log-cpu/log_cpu.log"
thresholdIdle=25
interval=1
duration=60 #60 detik
alert="CPU usage berada di atas 75%"

echo "Tekan 'CTRL + Z' untuk berhenti"
while true; do
    idleValues=()

    for ((i=0; i<duration; i+=interval)); do
        idleChecker=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print $1}')
        idleValues+=($idleChecker)
        sleep $interval
    done

    thresholdIdleStatus=true
    for value in "${idleValues[@]}"; do
        if (( $(echo "$value > $thresholdIdle" | bc -l) )); then
            thresholdIdleStatus=false
            break
        fi
    done

    timestamp=$(date '+%Y-%m-%d %H:%M:%S')

    if $thresholdIdleStatus; then
        echo "$timestamp: $alert" >> $logFile
    fi
done
