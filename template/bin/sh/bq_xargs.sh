#!/bin/bash -eux
source $HOME/PATH_TO_PROJECT_DIR/bin/conf
exec > $log/$(basename $0).$(date +%Y%m%d_%H%M%S).$$ 2>&1

input="$HOME/PATH_TO_PROJECT_DIR/bin/exec"

# 並列処理
# xargsはコマンド1回の実行でそこそこ大量に処理してくれちゃう
# -Lでそれを1に絞ることで、1cpuで1jobが走るイメージ
# -Pは使っている計算環境で適宜決める
find $input -name bq_parameter_* | sort | xargs -L 1 -P 24 bash

