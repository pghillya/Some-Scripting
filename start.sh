#!/bin/sh

# Remove any old .xlsx files from last run
if [ $(test -f *.xlsx && echo exists) ]; then
    file=`ls *.xlsx`
    echo "Removing file $file"
    rm $file
fi

# Run py script and check output, make sure it succeeded
result=`python3 script.py`
if [ $(echo $result | grep "success") ]; then
  echo "Py script successful"

  # Send the report
  echo -e "to: pghillya@ncsu.edu\nsubject: Your daily stocks summary!\ncontent-type: multipart/mixed\nContent-Disposition: attachment;filename=output.xlsx\nContent-Transfer-Encoding: base64"\
  | (cat - && uuencode -m ./BasicReport*.xlsx output.xlsx) | ssmtp pghillya@ncsu.edu 
  if [ $? -eq 0 ]; then # Check for exit code of previous command
    echo "Successfully sent mail!"
  else
    echo "Mail failed to send, please try again..."
  fi
else
  echo "Py script failed!"
fi

