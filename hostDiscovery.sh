#!/bin/bash

hosts=($@)

if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    echo "Usage: ./hostDiscovery.sh 192.168.1 192.168.2"
else
    for host in ${hosts[@]}; do
        echo -e "\n[+] Enumerating $host.0/24\n"
        for i in $(seq 1 254); do
            timeout 1 bash -c "ping -c 1 $host.$i" &> /dev/null && echo -e "\t[+] Host $host.$i - ACTIVE" &
        done; wait
    done
fi
