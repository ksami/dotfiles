TIME_24H="%k"
TIME_FULL="%l:%M %p"

GREEN="\e[32m"
RED="\e[31m"

TIMEZONES=("Europe/Stockholm" "Europe/London" "US/Pacific")
CITIES=("Stockholm" "Bristol" "Seattle")

for (( i = 1; i <= ${#TIMEZONES[@]}; i++ )); do
    export TZ=${TIMEZONES[$i]}
    CITY_24H=$(date +$TIME_24H)
    CITY_FULL=$(date +"$TIME_FULL")
    unset TZ

    if [ $CITY_24H -ge 9 -a $CITY_24H -le 17 ]; then
        echo -e "$GREEN${CITIES[$i]} $CITY_FULL"
    else
        echo -e "$RED${CITIES[$i]} $CITY_FULL"
    fi
done
