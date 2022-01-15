#!/bin/bash
# This is placed in /usr/bin/ dir on the Report Server itself
# Configure the cron to execute this shell script daily at 4:00PM EST
# e.g. crontab: 00 16 * * * bash /usr/bin/runStonksReport.sh
cd Some-Scripting/
git pull
docker rm stonks
docker rmi stonks
docker build -t stonks .
docker run --name stonks stonks
