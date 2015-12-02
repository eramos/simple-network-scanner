# simple-network-scanner

This simple script in shellscript allows you to scan and locate alive hosts in your local network.

Simply run "sh scanner.sh" and check the usage instructions.

Usage: scanner.sh (fast|detailed) logDir pingCounts limit
Detailed option uses ping and logs every single host from 0 to the specified limit
Fast option uses nmap and test ports 21, 22 and 3389
Fast option is more reliable to check whether hosts are alive or not
Example: scanner.sh detailed /var/tmp/ 4 254
Example: scanner.sh fast /var/tmp/
