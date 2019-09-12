#!/bin/bash -eux
source $HOME/PATH_TO_PROJECT_DIR/bin/conf
exec > $log/$(basename $0).$(date +%Y%m%d_%H%M%S).$$ 2>&1

bin="$HOME/PATH_TO_PROJECT_DIR/bin"
input="$HOME/PATH_TO_PROJECT_DIR/results/evaluation_value"
result="$HOME/PATH_TO_PROJECT_DIR/results"
title="melty"

# 出力dirの処理
if [ -e ${result} ]; then
    echo "result directory exist!"
else
    echo "result directory do not exist! mkdir result directory"
    mkdir -p ${result}
fi

# 結合処理(bqはあまり大きすぎるファイルを受け付けないらしい、2Gが程度までは経験あり)
# ヘッダーに関しては1つ目のファイルのみ、全てのファイルでヘッダー以外の行（つまり、データ部分）
awk 'NR==1 || FNR!=1' $input/${title}_*.csv > $result/all_bq_out.csv
