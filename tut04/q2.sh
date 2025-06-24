#!/bin/dash

cur_hour=$(date "+%H")

# is cur_hour >= 9 and cur_hour <= 17
# test "$cur_hour" -ge 9 -a "$cur_hour" -le 1
[ "$cur_hour" -lt 9 ] && [ "$cur_hour" -le 17 ]
