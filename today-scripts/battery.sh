pmset -g batt | { read; read n status; echo "$status"; }
