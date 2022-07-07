#!/bin/sh

if [ -f "/usr/decoymini/decoymini" -a -f "/usr/decoy/decoysvc" -a -d "/usr/decoymini/conf" -a -d "/usr/decoymini/data" ]; then
   if [ -z "$2" ]; then
      sed -i "s/^MgrAddr:.*$/MgrAddr: $1/g" /usr/decoymini/conf/config.yaml
      if [ -f "/etc/init.d/decoymini" ]; then
         service decoymini start
      else
         /usr/decoymini/decoymini -register
      fi
      echo Open your browser and visit http://$1 to continue. 
   else
      /usr/decoymini/decoymini -set -addr $2
      if [ -f "/etc/init.d/decoymini" ]; then
         service decoymini start
      else
         /usr/decoymini/decoymini -register
      fi
      echo Open your browser and visit $2 to manage this node. 
   fi
else
   chmod +x /home/DecoyMini.pkg
   if [ -z "$2" ]; then
      /home/DecoyMini.pkg -install -listen $1
   else
      /home/DecoyMini.pkg -install -addr $2
   fi
fi
tail -f /dev/null
