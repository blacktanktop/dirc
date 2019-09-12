# dirc

Project template for data analysis
Using bigquery, shell script and etc

## パラメーターのみが変化するコマンドを大量に叩く時に使用

例として、bigqueryでデータを週毎に決まったデータ範囲で何か処理して、その結果をcsvでも欲しいし、bigqueryでも叩きたい状況を想定
流れとしては、
1. 一つ一つのjobをテンプレートからシェルスクリプトにするためのシェルスクリプトを実行
1. そのシェルスクリプトをxargで並列実行

* 自身のProject dir配下にtemplate以下を配置
  1. ./bin/sh/list.sh
  1. ./bin/sh/get_bq_data.sh
  1. ./bin/sh/bq_xargs.sh
  
* 結果をbqに載せる（必要に応じて）
  1. ./bin/sh/concat.sh
  1. ./bin/bq/bq_table_name/make_empty_table.sh
  1. ./bin/bq/bq_table_name/load_data.sh
  
