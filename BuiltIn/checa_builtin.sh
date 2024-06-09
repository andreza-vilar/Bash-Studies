#!/usr/bin/env bash

help $1 &> /dev/null

[[ $? -eq 0 ]] && echo "$1 é interno!" || echo "$1 não é interno!"

exit 0
