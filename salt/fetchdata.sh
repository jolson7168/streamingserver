#!/bin/bash
TODAY=`date +%y%m%d`
START=`date --date="150211" +%y%m%d`
numDays=$(( ($(date --date=$TODAY +%s) - $(date --date=$START +%s) )/(60*60*24) ))
for i in $(seq 0 $((numDays-1))); do
    next=$(date +%Y%m%d -d "$START + $i day")
    wget -O /mnt/data/$next.zip https://s3.amazonaws.com/cta-tracker/$next.zip 
    unzip -d /mnt/data /mnt/data/$next.zip &
done
sleep 1m
mv /mnt/data/home/ec2-user/git/ctaTracker/data/*.json /mnt/data
rm /mnt/data/*.zip
rm -r /mnt/data/home
chown -R ubuntu:ubuntu /mnt/data
