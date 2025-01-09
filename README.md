# msf_cisco_rc_create
The MSF cisco_config_tftp auxiliary module ( auxiliary/scanner/snmp/cisco_config_tftp ) does not support using a wordlist of community strings for targeting SNMP versions 1 and 2c for remote configuration exfiltration. This bash script will create an MSF resource file to automate enumeration supporting a wordlist of community strings within a single MSFConsole session.

## Quick start
1. Download the bash script and make it executable (chmod +x cisco_rc_create.sh)
2. Edit the script's variables which correspond to the MSF options to desired lists, output dir, SNMP version, etc.
3. Execute! Optionally redirect to file for post-analysis ( nohup ./cisco_rc_create.sh > cisco_config.out 2>&1 & )


## Usage
```
nohup ./cisco_rc_create.sh > cisco_config.out 2>&1 &
```

## Disclaimer
This repository is created for educational purposes only. The content and scripts provided here are intended to enhance understanding and knowledge of ethical hacking concepts. Users are encouraged to use these resources responsibly and in compliance with ethical and legal standards.
