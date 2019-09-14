#!/bin/bash -eu
source $HOME/$PATH_TO_PROJECT_DIR/bin/conf
exec > $log/$(basename $0).$(date +%Y%m%d_%H%M%S).$$ 2>&1

inputs="$HOME/$PATH_TO_PROJECT_DIR/bin"
results="$HOME/$PATH_TO_PROJECT_DIR/common_data"

# 週毎
start_date="20181230" # Sunday
end_date="20190815" # last Sunday
tmp=$start_date
i=1

end_date=`date -d "$end_date"  "+%Y-%m-%d"`
while [ -n $start_date ]
do
  echo $i
  date --date "$tmp" "+%Y-%m-%d" >> $results/week_list_${start_date}.txt
  if [[ $tmp > $end_date ]] ; then
    break
  fi
  tmp=`date -d "$tmp 7day" "+%Y-%m-%d"`
  i=$(expr $i + 1)
done
echo "2019-06-19" >> $results/week_list_${start_date}.txt
echo finish

