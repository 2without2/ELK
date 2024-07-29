#!/bin/bash

PRIVATE_KEY="~/.ssh/private-key.pem"
USER="ubuntu"
HOST="35.174.18.227"
REMOTE_DIR="/home/ubuntu"
FILE1="values/"

ssh -i $PRIVATE_KEY $USER@$HOST sudo rm -rf $REMOTE_DIR/$FILE1
scp -r -i $PRIVATE_KEY $FILE1 $USER@$HOST:$REMOTE_DIR/$FILE1
