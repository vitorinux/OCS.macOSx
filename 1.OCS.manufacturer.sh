#!/bin/bash
sysctl -a | grep -i vendor | cut -d: -f2 | head -1 | sed 's/^ *//'
