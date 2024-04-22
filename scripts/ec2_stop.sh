#!/bin/bash
INSTANCE_ID=i-0a3ef21c1550daf62
STATUS=`aws ec2 describe-instance-status --instance-ids $INSTANCE_ID --query 'InstanceStatuses[0].InstanceState.Name'`
if [ $STATUS != '"running"' ]; then
  echo "ec2 already stoped"
  exit 0
fi

aws ec2 stop-instances --instance-ids $INSTANCE_ID > /dev/null
if [ $? -ne 0 ]; then
  echo "ec2 stop failed"
  exit 1
fi

