#!/bin/bash -eux
source $HOME/$PATH_TO_PROJECT_DIR/bin/conf
exec > $log/$(basename $0).$(date +%Y%m%d_%H%M%S).$$ 2>&1

list="$HOME/$PATH_TO_PROJECT_DIR/common_data"
bin="$HOME/$PATH_TO_PROJECT_DIR/bin"
result="$HOME/$PATH_TO_PROJECT_DIR/bin/exec"
template="$HOME/$PATH_TO_PROJECT_DIR/bin/templates"

# パラメータのリストの読み込み
sample=()
while read line
do
  txt=${line}
  sample=(${sample[@]} $txt)
#done<${list}/list.txt
listSize=${#sample[@]}
# 出力dirの処理
if [ -e ${result} ]; then
  # 存在する場合
  echo "result directory exist!"
else
  # 存在しない場合
  echo "result directory do not exist! mkdir result directory"
  mkdir -p ${result}
fi
 
for((i=0;i<$listSize;i++))
do
  call=`expr $i + 1`
  echo "$call / $listSize"
  echo  : ${sample[$i]}
  sed -e "s%XXXXXXXX%${sample[$i]}%g" ${template}/bq_parameter_template.sh > ${result}/bq_parameter_${sample[$i]}.sh
  chmod 700 ${result}/bq_parameter_${sample[$i]}.sh
  #sh ${list}/bq_evaluation_value_${sample[$i]}.sh
  #rm ${list}/bq_evaluation_value_${sample[$i]}.sh
done
