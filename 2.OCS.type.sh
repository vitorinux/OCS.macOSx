#!/bin/bash
sysctl -a | grep -i brand | cut -d: -f2 | head -1 | tr -d '[:blank:]'
