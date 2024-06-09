#!/usr/bin/env bash

help ls &> /dev/null

[[ $? -eq 0 ]] && echo "ls é interno!" || echo "ls não é interno!"

exit 0
