#!/bin/bash -eux
source $HOME/PATH_TO_PROJECT_DIR/bin/conf
exec > $log/$(basename $0).$(date +%Y%m%d_%H%M%S).$$ 2>&1

sql="$HOME/PATH_TO_PROJECT_DIR/bin/sql"
result="$HOME/PATH_TO_PROJECT_DIR/results"
exec_date="XXXXXXXX"
exec_date_str=$(echo $exec_date | sed -e "s/'//g")

if [ -e ${result} ]; then
    echo "result directory exist!"
else
    echo "result directory do not exist! mkdir result directory"
    mkdir -p ${result}
fi

date
echo $exec_date start!
gcloud config configurations activate default
bq query \
  --format csv \
  --max_rows=2147483647 \
  --nouse_legacy_sql \
  --parameter=exec_date::$exec_date \
  < $sql/template.sql | \
#1行目に空白があるので削除
sed '1{/^$/d}' > $result/${exec_date_str}_bq_output.csv
echo $exec_date finish!
date
