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

echo $MANUFACTURER > FULL.query.sql
echo $TYPE >> FULL.query.sql
echo $ID >> FULL.query.sql
echo $SPEED >> FULL.query.sql
echo $CORES >> FULL.query.sql
echo $L2CACHESIZE >> FULL.query.sql
echo $CPUARCH >> FULL.query.sql
echo $DATA_WIDTH >> FULL.query.sql
#echo $CURRENT_ADDRESS_WIDTH >> FULL.query.sql
echo $LOGICAL_CPUS >> FULL.query.sql
echo $VOLTAGE >> FULL.query.sql
#echo $CURRENT_SPEED >> FULL.query.sql
#echo $SOCKET >> FULL.query.sql
