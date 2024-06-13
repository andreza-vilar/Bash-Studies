#!bin/bash

COMMIT_TEXT=$1

git add . && git commit -m $COMMIT_TEXT && git push
