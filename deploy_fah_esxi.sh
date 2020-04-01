#!/bin/bash

# Sample Shell Script to deploy VMware Appliance for F@H to ESXi Host from MacOS

OVFTOOL_BIN_PATH="/Applications/VMware OVF Tool/ovftool"
FAH_OVA="VMware-Appliance-FaH_1.0.1.ova"

# ESXi
DEPLOYMENT_TARGET_ADDRESS="192.168.30.14"
DEPLOYMENT_TARGET_USERNAME="root"
DEPLOYMENT_TARGET_PASSWORD="VMware1!"

FAH_NAME="VMWARE-FAH"
FAH_CPU_COUNT="4"
FAH_IP="192.168.30.112"
FAH_HOSTNAME="fah.primp-industries.com"
FAH_PREFIX="24 (255.255.255.0)"
FAH_GW="192.168.30.1"
FAH_DNS="192.168.30.1"
FAH_DNS_DOMAIN="primp-industries.com"
FAH_NTP="pool.ntp.org"
FAH_OS_PASSWORD="VMware1!"
FAH_NETWORK="VM Network"
FAH_DATASTORE="sm-vsanDatastore"
FAH_DEBUG="True"
FAH_USERNAME="lamw"
FAH_PASSKEY="e6cf014f62ba0f60e6cf014f62ba0f60"
FAH_MODE="light"
FAH_TEAM="52737"
FAH_DEPLOYMENT_SIZE="medium"

### DO NOT EDIT BEYOND HERE ###

"${OVFTOOL_BIN_PATH}" \
    --X:injectOvfEnv \
    --powerOn \
    --noSSLVerify \
    --sourceType=OVA \
    --allowExtraConfig \
    --diskMode=thin \
    --deploymentOption="${FAH_DEPLOYMENT_SIZE}" \
    --numberOfCpus:*=${FAH_CPU_COUNT} \
    --name="${FAH_NAME}" \
    --net:"VM Network"="${FAH_NETWORK}" \
    --datastore="${FAH_DATASTORE}" \
    --prop:guestinfo.ipaddress=${FAH_IP} \
    --prop:guestinfo.hostname=${FAH_HOSTNAME} \
    --prop:guestinfo.netmask="${FAH_PREFIX}" \
    --prop:guestinfo.gateway=${FAH_GW} \
    --prop:guestinfo.dns=${FAH_DNS} \
    --prop:guestinfo.domain=${FAH_DNS_DOMAIN} \
    --prop:guestinfo.ntp=${FAH_NTP} \
    --prop:guestinfo.root_password=${FAH_OS_PASSWORD} \
    --prop:guestinfo.fah_username=${FAH_USERNAME} \
    --prop:guestinfo.fah_passkey=${FAH_PASSKEY} \
    --prop:guestinfo.fah_mode=${FAH_MODE} \
    --prop:guestinfo.fah_team=${FAH_TEAM} \
    --prop:guestinfo.debug=${FAH_DEBUG} \
    "${FAH_OVA}" \
    "vi://${DEPLOYMENT_TARGET_USERNAME}:${DEPLOYMENT_TARGET_PASSWORD}@${DEPLOYMENT_TARGET_ADDRESS}/"
