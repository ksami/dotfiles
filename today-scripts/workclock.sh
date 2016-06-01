if [ $(date +'%k') -ge 9 -a $(date +'%k') -le 17 ]; then
    echo "\e[32m$(date +'%l:%M %p')";
else
    echo "\e[31m$(date +'%l:%M %p')";
fi
