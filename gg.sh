#!/bin/bash

# declare target server location and folder (gg)
# set time interval checks (3 hours for WARN alert and 10 hours for ERROR alert) this is an example for now
# declare counter (initially set at 0) 
# declare timer variable
# create function that monitors target folder(gg) 
 #While conditions: while the folder exists  
  # Conditional statements:
    #If new file appears in gg increase counter value to 1 and reset timer (send notification to rocket chat that all is good)
    #If counter is at 0 and timer > 4 hours, send WARN notification (send notification to nagios and rocketchat)
    #If counter is at 0 and timer > 10 hours, send ERROR notification (send notification to nagios and rocketchat, trigger jira incident)
# Call function
  
  
