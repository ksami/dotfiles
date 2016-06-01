TIME_24H="%k"
TIME_FULL="%l:%M %p"

# Seattle, WA, US
export TZ="US/Pacific"
SEATTLE_24H=$(date +$TIME_24H)
SEATTLE_FULL=$(date +"$TIME_FULL")

# Bristol, UK
export TZ="Europe/London"
BRISTOL_24H=$(date +$TIME_24H)
BRISTOL_FULL=$(date +"$TIME_FULL")

unset TZ

if [ $SEATTLE_24H -ge 8 -a $SEATTLE_24H -le 17 ]; then
    echo -e "\e[32mSeattle $SEATTLE_FULL"
else
    echo -e "\e[31mSeattle $SEATTLE_FULL"
fi

if [ $BRISTOL_24H -ge 8 -a $BRISTOL_24H -le 17 ]; then
    echo -e "\e[32mBristol $BRISTOL_FULL"
else
    echo -e "\e[31mBristol $BRISTOL_FULL"
fi
