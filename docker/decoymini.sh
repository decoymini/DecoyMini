#!/bin/bash

# 判断DecoyMini是否已经安装
if [ -f "/usr/decoymini/decoymini" -a -f "/usr/decoy/decoysvc" -a -d "/usr/decoymini/conf" -a -d "/usr/decoymini/data" ]; then
   # 判断DecoyMini运行模式
   if [[ -n "$1" && -z "$2" ]]; then
      # 以管理中心模式运行
      proto=http
      addr=$1
      if [[ ${1,,} == https://* ]]; then
         proto=https 
         addr=${1#*//}
      elif [[ ${1,,} == http://* ]]; then
         proto=http
         addr=${1#*//}
      fi
      # 更新管理端地址参数
      grep "^MgrAddr: " /usr/decoymini/conf/config.yaml >> /dev/null
      if [[ $? -eq 0 ]]; then
         sed -i "s/^MgrAddr:.*$/MgrAddr: $addr/g" /usr/decoymini/conf/config.yaml
      else
         echo "MgrAddr: $addr" >> /usr/decoymini/conf/config.yaml
      fi
      grep "^MgrProto: " /usr/decoymini/conf/config.yaml >> /dev/null
      if [[ $? -eq 0 ]]; then
         sed -i "s/^MgrProto:.*$/MgrProto: $proto/g" /usr/decoymini/conf/config.yaml
      else
         echo "MgrProto: $proto" >> /usr/decoymini/conf/config.yaml
      fi
      # 启动DecoyMini服务
      if [ -f "/etc/init.d/decoymini" ]; then
         service decoymini start
      else
         /usr/decoymini/decoymini -register
      fi  
      echo Open your browser and visit $proto://$addr to continue. 
   elif [ -n "$2" ]; then
      # 以诱捕探针模式运行
      /usr/decoymini/decoymini -set -addr $2
      if [ -f "/etc/init.d/decoymini" ]; then
         service decoymini start
      else
         /usr/decoymini/decoymini -register
      fi
      echo Open your browser and visit $2 to manage this node. 
   fi
else
   # 执行首次安装
   chmod +x /home/DecoyMini.pkg
   if [ -z "$2" ]; then
      # 以管理节点模式安装
      /home/DecoyMini.pkg -install -listen $1
   else
      # 以诱捕探针模式安装
      /home/DecoyMini.pkg -install -addr $2
   fi
fi
tail -f /dev/null
