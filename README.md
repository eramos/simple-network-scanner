# Simple Network Scanner

This simple script in shellscript allows you to scan and locate alive hosts in your local network.

## Software required

NMAP is required for `detailed` option

## Usage

Simply run "sh scanner.sh" and check the usage instructions.

`scanner.sh (fast|detailed) logDir pingCounts limit`

- Detailed option uses ping and logs every single host from 0 to the specified limit

Example: `scanner.sh detailed /var/tmp/ 4 254`

- Fast option uses NMAP and test ports 21, 22 and 3389. It is more reliable to check whether hosts are alive or not

Example: `scanner.sh fast /var/tmp/`
