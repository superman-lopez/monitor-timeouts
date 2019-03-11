# monitor-timeouts
Simple bash script that uses ping timeouts as a way to determine network disconnects.  By default it uses google.com as the domain to ping, alternatively a target can be included as parameter.
## Install

To download this bash script and give it the correct permissions:
```
curl -O https://raw.githubusercontent.com/superman-lopez/monitor-timeouts/master/monitor-timeouts.sh && chmod +x monitor-timeouts.sh
```

## Usage

The bash script can be run without parameters as: 
```
./monitor-timeouts.sh
```

This will run the monitor script for 1 minute and target google.com.  Alternatively a target and the number of minutes for which the script should run can be passed as parameters `./monitor-timeouts.sh [duration] [target]`:
```
./monitor-timeouts.sh 60 192.168.1.1
```
This will run the monitor script for 60 minutes with 192.168.1.1 as the target of the pings. *Duration as an approximation: the command is actually 60 pings per minute multiplied with the requested duration.  Actual duration might be longer or shorter depending on the ping results.*

### Compatibility
This script and the installation instructions has been tested on macOS running Bash version 3, Ubuntu Linux running Bash version 4, Synology DSM running Bash version 4.  I expect you can run this script and the installation instructions on most systems running Bash, without problems.  On some systems you might need to run the command with elevated rights (`sudo`).
