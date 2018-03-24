#!/bin/bash

# 1.OCS Get Manufacturer
get_cpu_mnfct() {
	m=`sysctl -a | grep -i vendor | cut -d: -f2 | head -1 | sed 's/^ *//'`
	export MANUFACTURER=`echo $m`
}

# 2.OCS Get CPU Type, Model and Frecuency. Global data
get_cpu_type() {
	t=`sysctl -a | grep -i brand | cut -d: -f2 | head -1 | tr -d '[:blank:]'`
	export TYPE=`echo $t`
}

# 3.OCS CPU Serial Number
get_cpu_id() {
	s=`dmidecode 2>&1 | grep ID | cut -d : -f2 | head -1 | sed 's/^ *//'`
	export SERIALNUMBER=`echo $s`
}

# 4.OCS
get_cpu_speed() {
	sp=$[`sysctl -a | grep hw.cpufrequency: | cut -d: -f2 | sed 's/^ *//'` / 1000000]
	export SPEED=`echo $sp`
}

# 5.OCS
get_cpu_cores() {
	cor=`sysctl -a | grep machdep.cpu.core_count | cut -d: -f2 | sed 's/^ *//'`
	export CORES=`echo $cor`
}

# 6.OCS
get_cpu_cachedos() {
	eledos=$[`sysctl -a | grep hw.l2cachesize | cut -d: -f2 | sed 's/^ *//'` / 1024]
	export L2CACHESIZE=`echo $eledos`
}

# 7.OCS
get_cpu_arch() {
	ar=`uname -m`
	export CPUARCH=`echo $ar`
}

# 8.OCS
get_cpu_data_width() {
	dw=`sysctl -a | grep machdep.cpu.tlb.data.large_level1: | cut -d: -f2 | sed 's/^ *//'`
	export DATA_WIDTH=`echo $dw`
}

# 9.OCS
get_cpu_current_addr_width() {
	dw=`sysctl -a | grep machdep.cpu.tlb.data.large_level1: | cut -d: -f2 | sed 's/^ *//'`
	export CURRENT_ADDRESS_WIDTH=`echo $dw`
}
# 10.OCS
get_cpu_logical() {
	log=`sysctl -a | grep machdep.cpu.thread_count | cut -d: -f2 | sed 's/^ *//'`
	export LOGICAL_CPUS=`echo $log`
}

# 11.OCS
get_cpu_volts() {
	v=`dmidecode 2>&1 | grep Voltage | cut -d: -f2 | head -1 | sed 's/^ *//'`
	export VOLTAGE=`echo $v`
}

# 12.OCS
get_cpu_cur_speed() {
	csp=$[`sysctl -a | grep hw.cpufrequency: | cut -d: -f2 | sed 's/^ *//'` / 1000000]
	export CURRENT_SPEED=`echo $csp`
}

# 13.OCS
get_cpu_socket() {
	soc=`dmidecode 2>&1| grep "Socket Designation:" | cut -d: -f2 | sed 's/^ *//'`
	export SOCKET=`echo $soc`
}

#get_query() {
#	export QUERY=`echo "'',$HARDWARE_ID,$MANUFACTURER,$TYPE,$SERIALNUMBER,$SPEED,$CORES,$L2CACHESIZE,$CPUARCH,$DATA_WIDTH,$CURRENT_ADDRESS_WIDTH,$LOGICAL_CPUS,$VOLTAGE,$CURRENT_SPEED,$SOCKET"`
	#export QUERY=`echo $sql`
#}

# GET ALL FUNCTIOS
#get_query
get_cpu_mnfct
get_cpu_type
get_cpu_id
get_cpu_speed
get_cpu_cores
get_cpu_cachedos
get_cpu_arch
get_cpu_data_width
get_cpu_current_addr_width
get_cpu_logical
get_cpu_volts
get_cpu_cur_speed
get_cpu_socket


#echo $QUERY
### CONVERT OUTPUT VARIABLES ON CSV FILE:
#LOG="./query.txt"


USER="ocs"
PASS="26B9D1D346EB2B5581A267BAB19394A98DF01F12"
if [ $# -ne 1 ];
	then
	echo $0 DATAFILE
	echo
	exit 2
fi

data=$1

while read line;
do
	oldIFS=$IFS
	IFS=,
	values=($line)
	values[1]="\"`echo ${values[1]} | tr ' ' '#' `\""
	values[3]="\"`echo ${values[3]}`\""
	query=`echo ${values[@]} | tr ' #' ', ' `

	IFS=$oldIFS
	mysql -h 172.20.30.105 -u $USER -p$PASS ocsweb <<EOF
INSERT INTO cpus VALUES($query);
EOF

done< $data

echo Wrote data into DB


#mysql -h 172.20.30.105 -u ocs --password=26B9D1D346EB2B5581A267BAB19394A98DF01F12 ocsweb<< EOF
#INSERT INTO cpus (`ID`, `HARDWARE_ID`, `MANUFACTURER`, `TYPE`, `SERIALNUMBER`, `SPEED`, `CORES`, `L2CACHESIZE`, `CPUARCH`, `DATA_WIDTH`, `CURRENT_ADDRESS_WIDTH`, `LOGICAL_CPUS`, `VOLTAGE`, `CURRENT_SPEED`, `SOCKET`) VALUES
#('', 6, $MANUFACTURER, $TYPE, $SERIALNUMBER, $SPEED, $CORES, $L2CACHESIZE, $CPUARCH, $DATA_WIDTH, $CURRENT_ADDRESS_WIDTH, $LOGICAL_CPUS, $VOLTAGE, $CURRENT_SPEED, $SOCKET);
#EOF
