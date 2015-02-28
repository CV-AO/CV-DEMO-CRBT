#!/bin/sh
#
# Module package
# auth <<CV.AO T-SHIOTSUKA>>
#

# 開始宣言
echo "[START][ao-modulepack]`date`"

MODULEDIR=/opt/cv/ao-module

# dropboxファイル一覧取得（.m4a .out）、差分ファイル作成
echo "--- ao-filelist.sh ---"
${MODULEDIR}/ao-filelist.sh

# 空ファイルチェック
filename=/opt/cv-data/work/dbdiff.list
NUM=`wc -l ${filename} | awk '{print $1}'`
if [ ${NUM} = 0 ]; then
 # 終了宣言
 echo "[END][ao-modulepack]`date`"
 exit 0
fi

# 音声変換メイン処理
i=0
while [ $i -lt ${NUM} ]; do
 i=`expr $i + 1`
 targetfile=`cat ${filename} | awk "NR==$i"`
 echo "--- ao-m4a2wav.sh ---"
 ${MODULEDIR}/ao-m4a2wav.sh ${targetfile}
 echo "--- ao-sox.sh ---"
 ${MODULEDIR}/ao-sox.sh ${targetfile}
done

# 音声解析メイン処理
echo "--- ao-wav2text.sh ---"
${MODULEDIR}/ao-wav2text.sh
sleep 3

# 終了宣言
echo "[END][ao-modulepack]`date`"
