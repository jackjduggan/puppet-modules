This module is used to create Nagios NCPA passive checks.

In init.pp, you specifiy the threshold values as numbers. An .erb template is used to create a bash script using these specified parameters.

In thresholdchecks_disk.erb, a lot of (probably inefficient) output manipulation is performed upon the lsblk output.
This output is then transformed into the passive check syntax and combined with the thresholds from init.pp

The output creates an easy to read bash script.

Running the bash script gives you an output you can put into Nagios (I think? I'm not sure I didn't get that far myself)
