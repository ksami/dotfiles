if [ $(date +'%H') -ge 9 -a $(date +'%H') -le 17 ]; then
    echo "\e[32m$(date +'%l:%M %p')";
else
    echo "\e[31m$(date +'%l:%M %p')";
fi
