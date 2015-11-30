#!/bin/sh

#Check whether the input is correct or not
validate_input () {
  if [ -z $1 ]
  then
    return 0
  fi

  if [ -z $2 ]
  then
    current_dir="/var/tmp/"
  else
    current_dir=$2
  fi

  if [ $3 > 0 ]
  then
    limit=$3
  else
    limit=254
  fi

  return 1
}

option=$1
ping_count=$3

validate_input $option $2 $4

if [ $? -eq 1 ]
then
  now=$(date +"%Y_%m_%d_%H:%m:%S")
  online_log_file=$current_dir"online_hosts_"$now".log"
  offline_log_file=$current_dir"offline_hosts_"$now".log"

  case $option in
    "detailed")
      for i in $(seq 0 $limit)
      do
          current_ip=192.168.1.$i
          ping -c$ping_count $current_ip > /dev/null 2>&1
          if [ $? -eq 0 ]; then
            echo $current_ip "is online at:" >> $online_log_file
            date >> $online_log_file
            echo "\n" >> $online_log_file
          else
            echo $current_ip "is offline at:" >> $offline_log_file
            date >> $offline_log_file
            echo "\n" >> $offline_log_file
          fi
      done
    ;;
    "fast")
      nmap -sP -PS21,22,3389 192.168.1.1/24 >> $online_log_file
    ;;
  esac
else
  echo "Usage: scanner.sh (fast|detailed) logDir pingCounts limit\n"
  echo "Detailed option uses ping and logs every single host from 0 to the specified limit"
  echo "Fast option uses nmap and test ports 21, 22 and 3389"
  echo "Fast option is more reliable to check whether hosts are alive or not\n"
  echo "Example: scanner.sh detailed /var/tmp/ 4 254"
  echo "Example: scanner.sh fast /var/tmp/\n"
fi

exit
