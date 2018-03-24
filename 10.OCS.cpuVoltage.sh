dmidecode | grep Voltage | cut -d: -f2 | head -1 | sed 's/^ *//'
