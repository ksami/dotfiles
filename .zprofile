#
# ~/.zprofile
#

export PATH=$PATH:/usr/local/bin/sublime_text_3:/usr/local/bin/Telegram

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
