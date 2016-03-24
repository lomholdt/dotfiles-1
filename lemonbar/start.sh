
LEMONBAR_SCRIPT="$(dirname $0)/lemonbar.sh"
sh $LEMONBAR_SCRIPT | \
  lemonbar -d -p \
    -g "2823x50+28+15" \
    -B "#333333" \
    -F "#FFFFFF" \
    -f "Helvetica Neue LT Std 25 Ultra Light:size=9" \
    -o -1 \
    -f "FontAwesome-9" \
    -o -4

