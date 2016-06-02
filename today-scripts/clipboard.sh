pbpaste | head -5; count=$(($(pbpaste | wc -l)-5)); if [ $count -ge 0 ]; then echo "=== $count more lines ==="; fi
