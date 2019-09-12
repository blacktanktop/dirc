#!/bin/bash -eux
source $HOME/PATH_TO_PROJECT_DIR/bin/conf
exec > $log/$(basename $0).$(date +%Y%m%d_%H%M%S).$$ 2>&1

input="$HOME/PATH_TO_PROJECT_DIR/bin/bq/bq_tabel_name"

gcloud config configurations activate default

bq load --source_format=CSV --skip_leading_rows=1 PROJECT:DATASET.TABLE ~/PATH_TO_PROJECT_DIR/results/all_bq_out.csv ~/PATH_TO_PROJECT_DIR/bq/schema.json

# headerがある場合は--skip_leading_rows=1とする
# bq load [option] [project:dataset.table] [data] [schema]
