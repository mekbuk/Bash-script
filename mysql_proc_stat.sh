#!/bin/sh

mysqladmin proc stat | grep -v + | cut -d "|" -f3 | sort | uniq -c | sort -n
