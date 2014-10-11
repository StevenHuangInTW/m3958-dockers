#!/bin/bash

# here doc put on last of command line.

hs=$(cat <<-FORREAD 
  hello here documents
FORREAD
)
echo $hs

# >word 2>&1 duplicating fd.

#dnsrun=$(cat <<-YYYY
##!/bin/bash
#
#/usr/sbin/dnsmasq -c /abchhelo
#YYYY
#)
#
#echo -e $dnsrun > hello.sh

read -ra mysh <<-YYYY
#!/bin/bash

/usr/sbin/dnsmasq -c /abchhelo
YYYY

for line in "${mysh[@]}"; do
  echo $line >> hello.sh
done
