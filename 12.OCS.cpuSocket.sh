#!/bin/bash
dmidecode 2>&1| grep "Socket Designation:" | cut -d: -f2 | sed 's/^ *//' | awk 'FNR == 1 {print $1}'
