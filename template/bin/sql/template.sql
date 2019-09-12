-- bigqueryで時間をパラメータとして期間設定して、その範囲のデータを使って出力するなどの用途
WITH tmp_data AS(
  SELECT
  --適宜列を指定
    *
  FROM
    DATASET.TABLE
  WHERE TRUE
    AND _PARTITIONTIME >= timestamp(DATE_SUB(DATE(@exec_date),  INTERVAL 30 DAY))
    AND _PARTITIONTIME < timestamp(DATE(@exec_date))
)
,
-- 適宜データを集計

-- 最終出力

SELECT
 *
FROM
 _tmp
ORDER BY
 hoge,
 huga
