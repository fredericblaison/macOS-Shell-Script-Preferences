#!/bin/sh

# +----------------------------------------------------------------+
# |                                                                |
# |               macOS: Shell Script Preferences                  |
# |                                                                |
# |                       version 0.1.0                            |
# |                                                                |
# |                       Oct 15, 2017                             |
# |                                                                |
# | Features :                                                     |
# | - prevents to edit the script itself                           |
# | - creates prefs plist file                                     |
# | - checks plist integrity before to execute script              |
# | - interacts with end-user to validate prefs plist file         |
# |                                                                |
# | Revision(s):                                                   |
# | - none                                                         |
# |                                                                |
# | Requirement(s):                                                |
# | - macOS 10.12 or greater recommended                           |
# |                                                                |
# | Autor(s): Fred Blaison, Paris - France                         |
# |                                                                |
# +----------------------------------------------------------------+


#============#
# CONSTANTS  #
#============#

# Path to preferences folder
prefsDir=$HOME/Library/Preferences/ShellScriptPreferences

# Create preferences folder only if it doesn't exist with -p arg
mkdir -p ${prefsDir}


#============#
# FUNCTIONS  #
#============#

# Main function to ensure preferences plist file existence and validity
checkPrefsPlistExistence()
{
# The preferences plist file exists, we check it
if [ -f "${prefsDir}/com.ShellScriptPreferences.plist" ]; then
	checkPrefsPlistValidity	
# The preferences plist file does not exist, we create it
else
	createPrefsPlist
fi
}

# Check the validity of the preferences plist file (it ensures no empty variable)
checkPrefsPlistValidity()
{
	# Get plist values
	valueA_alias=`defaults read ${prefsDir}/com.ShellScriptPreferences.plist valueA`
	valueB_alias=`defaults read ${prefsDir}/com.ShellScriptPreferences.plist valueB`
	valueC_alias=`defaults read ${prefsDir}/com.ShellScriptPreferences.plist valueC`
	valueD_alias=`defaults read ${prefsDir}/com.ShellScriptPreferences.plist valueD`
	valueE_alias=`defaults read ${prefsDir}/com.ShellScriptPreferences.plist valueE`
	valueF_alias=`defaults read ${prefsDir}/com.ShellScriptPreferences.plist valueF`
	
	# Detect empty value, if any value is empty we recreate the preferences plist file again
	if [[ -z ${valueA_alias} || -z ${valueB_alias} || -z ${valueC_alias} || -z ${valueD_alias} || -z ${valueE_alias} || -z ${valueF_alias} ]]; then
		echo ''
		echo "Plist file is corrupted, please recreate it!"
		createPrefsPlist
	else	
		# Print values
		echo ''
		echo "We are running with the following:"
		echo ''
		echo "Title for Value A: ${valueA_alias}"
		echo "Title for Value B: ${valueB_alias}"
		echo "Title for Value C: ${valueC_alias}"
		echo "Title for Value D: ${valueD_alias}"
		echo "Title for Value E: ${valueE_alias}"
		echo "Title for Value F: ${valueF_alias}"
	
		# Get confirmation
		echo ''
		echo "Do you confirm info above?"
		echo "Answer YES (y) to continue or NO (n) to modify the preferences:"
		read answer
		if [[ x$answer != xn && x$answer != xno && x$answer != xNO && x$answer != xnope ]]; then
			echo ''
			echo "Okay: Let's Go To Ride!"
		else
			createPrefsPlist
		fi
	fi
}

# Add values to the preferences plist file
createPrefsPlist()
{
	echo ''
	echo "For the execution of the script:"
	
	#Set the Value A
	echo ''
	echo "What is the value A?"
	read -p "(Default=Value A | leave Empty to use it) " valueA
	valueA=${valueA:-Value A}
	
	#Set the Value B
	echo ''
	echo "What is the value B?"
	read -p "(Default=Value B | leave Empty to use it) " valueB
	valueB=${valueB:-Value B}
	
	#Set the Value C
	echo ''
	echo "What is the value C?"
	read -p "(Default=Value C | leave Empty to use it) " valueC
	valueC=${valueC:-Value C}
	
	#Set the Value D
	echo ''
	echo "What is the value D?"
	read -p "(Default=Value D | leave Empty to use it) " valueD
	valueD=${valueD:-Value D}
	
	#Set the Value E
	echo ''
	echo "Which is the value E?"
	read -p "(Default=Value E | leave Empty to use it) " valueE
	valueE=${valueE:-Value E}
	
	#Set the Value F
	echo ''
	echo "Which is the value F?"
	read -p "(Default=Value F | leave Empty to use it) " valueF
	valueF=${valueF:-Value F}

	writePrefsPlist
	
}

# Create the preferences plist file on disk
writePrefsPlist()
{
echo "<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>valueA</key>
	<string>${valueA}</string>
	<key>valueB</key>
	<string>${valueB}</string>
	<key>valueC</key>
	<string>${valueC}</string>
	<key>valueD</key>
	<string>${valueD}</string>
	<key>valueE</key>
	<string>${valueE}</string>
	<key>valueF</key>
	<string>${valueF}</string>
	<key>NSHumanReadableCopyright</key>
	<string>macOS Shell Script Preferences</string>
</dict>
</plist>" > ${prefsDir}/com.ShellScriptPreferences.plist
}

# Declare constants to pursue the run
getConstants()
{
	# Set constants from existing plist
	valueA=`defaults read ${prefsDir}/com.ShellScriptPreferences.plist valueA`
	valueB=`defaults read ${prefsDir}/com.ShellScriptPreferences.plist valueB`
	valueC=`defaults read ${prefsDir}/com.ShellScriptPreferences.plist valueC`
	valueD=`defaults read ${prefsDir}/com.ShellScriptPreferences.plist valueD`
	valueE=`defaults read ${prefsDir}/com.ShellScriptPreferences.plist valueE`
	valueF=`defaults read ${prefsDir}/com.ShellScriptPreferences.plist valueF`
}


#============#
# ALGORITHM  #
#============#

# Attach below the code which uses variables stored in the preferences plist file

# Checks preferences
checkPrefsPlistExistence

# Code to be run
echo ''
echo "Here we will run the script code."
echo ''


#============#
# EXIT       #
#============#

exit
