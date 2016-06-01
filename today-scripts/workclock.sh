FG_DEFAULT="39"
FG="3"
BG="4"
DEFAULT="9"
BLACK="0"
RED="1"
GREEN="2"
YELLOW="3"
BLUE="4"
MAGENTA="5"
CYAN="6"
LGRAY="7"

TIME_24H=$(date +'%k')
TIME_FULL=$(date +'%l:%M %p')

if [ $TIME_24H -ge 9 -a $TIME_24H -lt 12 ]; then
    echo "\e["$FG$GREEN";"$BG$DEFAULT"m"$TIME_FULL
elif [ $TIME_24H -ge 12 -a $TIME_24H -lt 14 ]; then
    echo "\e["$FG$GREEN";"$BG$BLUE"m"$TIME_FULL
elif [ $TIME_24H -ge 14 -a $TIME_24H -lt 17 ]; then
    echo "\e["$FG$GREEN";"$BG$LGRAY"m"$TIME_FULL
else
    echo "\e["$FG$RED";"$BG$DEFAULT"m"$TIME_FULL
fi
