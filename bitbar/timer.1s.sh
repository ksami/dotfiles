#!/bin/bash
#
# <bitbar.title>Timer</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>ksami</bitbar.author>
# <bitbar.author.github>ksami</bitbar.author.github>
# <bitbar.desc>Timer</bitbar.desc>
# <bitbar.abouturl>https://github.com/ksami/dotfiles/bitbar</bitbar.abouturl>

# Start Timer
if [ "$1" = 'start' ]; then
    echo "$(date +%s)" > /tmp/timer.data
fi

# Stop Timer
if [ "$1" = 'stop' ]; then
    echo "0" > /tmp/timer.data
    exit
fi


# Header Display
if [ ! -f /tmp/timer.data ]; then
    echo "0" > /tmp/timer.data
fi

START_TIME=$(cat /tmp/timer.data)

if [ $START_TIME -gt 0 ]; then
    TIME_DIFF=$(($(date +%s) - $START_TIME))
    printf "%02d:%02d:%02d\n" $(($TIME_DIFF/3600)) $(($TIME_DIFF%3600/60)) $(($TIME_DIFF%60))
else
    echo "00:00:00"
fi


# Set menu options
echo '---'
echo "Start | color=green bash=$0 param1=start terminal=false"
echo "Stop | color=red bash=$0 param1=stop terminal=false"
