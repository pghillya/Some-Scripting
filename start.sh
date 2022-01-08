#!/bin/bash
python script.py
service sendmail start

echo "Your daily market close summary report" | mutt -e "set from='peter hillyard <autoreports@petersReportServer>'"\
 -a BasicReport*.xlsx -s "Daily Stonks Summary" -- pghillya@ncsu.edu
if [ $? -eq 0 ]
then
  echo "Successfully sent mail!"
else
  echo "Mail failed to send, please try again..."
fi

# Make sure the container has a little extra time to send before it exits
 sleep 20s

 
