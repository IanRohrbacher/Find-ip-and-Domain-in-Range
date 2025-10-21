#!/bin/bash

OUTPUTFILE="Results.txt"
mkdir -p "$(dirname "$OUTPUTFILE")"
: > "$OUTPUTFILE"

octet1=0
octet2=0

start_octet3=0
end_octet3=0

start_octet4=0
end_octet4=255

echo "Starting nslookup from $octet1.$octet2.$start_octet3.0 to $octet1.$octet2.$end_octet3.255"
for ((octet3=start_octet3; octet3<=end_octet3; octet3++)); do
    echo "Starting octet3: $octet3" >> "${OUTPUTFILE}"
    for ((octet4=start_octet4; octet4<=end_octet4; octet4++)); do
        ip="$octet1.$octet2.$octet3.$octet4"
        name=$(nslookup "$ip" 2>/dev/null | sed -n 's/.*name = //p' | sed 's/\.$//')
        if [[ -n "$name" ]]; then
            echo "$ip: $name" >> "${OUTPUTFILE}"
        fi
    done
    echo "------------------------------------" >> "${OUTPUTFILE}"
done
echo "nslookup completed." >> "$OUTPUTFILE"
echo "nslookup completed. Results saved in $OUTPUTFILE"
