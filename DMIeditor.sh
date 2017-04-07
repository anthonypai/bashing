#!/bin/bash
### Weolcome to Supermicro Strategic Global Service (SSGS) ###
# This is an automation tool for replacement motherboards ONSITE enabling to edit and to update DMI information #
# DMI Inputs for System's Serial Number, System's Model Part Number and Replaced Motherboard's Serial Number #
## Credits to it's creators/developters: Anthony Pai, Ryan Lee and Chris Morikang from Supermicro SSGS ##
## Date created: OCTOBER 25th 2016 ##


## STEP 1: [MANUAL INPUT] Getting DMI Information ##

#Requesting System's Serial Number
echo -e "Please enter System Serial Number"
read SYSN
# Requesting System's Model Part Number
echo -e "Please enter System Model Part Number"
read SYPD
# Requesting New Motherboard's Serial Number
echo -e "Please enter New Motherboard's Serial Number"
read BBSN

## STEP 2: [Automation] Output confirmation that the input information has being recorded and run registration ##
# Message to confirm input information and saving a text record by System's Serial Number into root directory #
outFilePath="/root/DMI_"$SYSN".txt"
echo "Saving DMI INFO to "$outFilePath

# Registry into DMI #
/root/SSGS/sum -c GetDMIinfo --file "$outFilePath"
/root/SSGS/sum -c editdmiinfo --file "$outFilePath" --shn SYSN --value "$SYSN"
/root/SSGS/sum -c editdmiinfo --file "$outFilePath" --shn SYPD --value "$SYPD"
/root/SSGS/sum -c editdmiinfo --file "$outFilePath" --shn BBSN --value "$BBSN"

# Uploading new DMI information #
/root/SSGS/sum -c ChangeDmiInfo --file /tmp/dmi.txt


## STEP 3: [REBOOT] MESSAGE before rebooting the system ##
read -p "Please press ENTER to REBOOT the system and REMOVE the DMIeditor USB drive. Have a great Day !!! Supermicro Strategic Global Service department." 

# Reboot #
reboot

### END of Script ###
