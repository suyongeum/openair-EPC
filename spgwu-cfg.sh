#!/bin/bash

cd /openair-spgwu-tiny

INSTANCE=1
PREFIX='/openair-spgwu-tiny/etc'

declare -A SPGWU_CONF

SPGWU_CONF[@INSTANCE@]=$INSTANCE
SPGWU_CONF[@PID_DIRECTORY@]='/var/run'
SPGWU_CONF[@SGW_INTERFACE_NAME_FOR_S1U_S12_S4_UP@]='eth0'
SPGWU_CONF[@SGW_INTERFACE_NAME_FOR_SX@]='eth0'
SPGWU_CONF[@PGW_INTERFACE_NAME_FOR_SGI@]='eth0'
SPGWU_CONF[@SPGWC0_IP_ADDRESS@]='192.168.61.4'
SPGWU_CONF[@NETWORK_UE_IP@]='12.1.1.0/24'
SPGWU_CONF[@NETWORK_UE_NAT_OPTION@]='yes'
SPGWU_CONF[@THREAD_S1U_PRIO@]=80
SPGWU_CONF[@S1U_THREADS@]=8
SPGWU_CONF[@THREAD_SX_PRIO@]=81
SPGWU_CONF[@SX_THREADS@]=1
SPGWU_CONF[@THREAD_SGI_PRIO@]=80
SPGWU_CONF[@SGI_THREADS@]=8
SPGWU_CONF[@BYPASS_UL_PFCP_RULES@]='no'

for K in "${!SPGWU_CONF[@]}"; do 
  egrep -lRZ "$K" $PREFIX | xargs -0 -l sed -i -e "s|$K|${SPGWU_CONF[$K]}|g"
done

exit 0
