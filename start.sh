#!/bin/sh
result=`python3 script.py`
echo $result
echo -e "to: pghillya@ncsu.edu\nsubject: Your daily stocks summary!\ncontent-type: multipart/mixed\nContent-Disposition: attachment;filename=output.xlsx\nContent-Transfer-Encoding: base64"\
 | (cat - && uuencode -m ./BasicReport*.xlsx output.xlsx) | ssmtp pghillya@ncsu.edu  # Supress uuencode output
if [ $? -eq 0 ]
then
  echo "Successfully sent mail!"
else
  echo "Mail failed to send, please try again..."
fi
# Make sure the container has a little extra time to send before it exits
# I know there's a more elegant solution for this-
sleep 5s