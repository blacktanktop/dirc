#!/bin/bash -eux
source $HOME/PATH_TO_PROJECT_DIR/bin/conf
exec > $log/$(basename $0).$(date +%Y%m%d_%H%M%S).$$ 2>&1

input="$HOME/PATH_TO_PROJECT_DIR/bin/bq_table_name"

gcloud config configurations activate default
# --time_partitioning_fieldはspartitionを区切りたい列を指定
bq mk --table --schema $input/schema.json --time_partitioning_field FFFFFF PROJECT_ID:DATASET.TABLE
# --schema [schema.json]として列定義をする必要がある
# --time_partitioning_field [列名] とすると列名でpatitionを区切る(ただしDATEかTIMESTAMP)
# bw mk [option] [project:dataset.table]
