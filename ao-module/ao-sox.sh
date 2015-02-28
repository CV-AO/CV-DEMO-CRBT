#!/bin/sh
#
# Convert framerate
# auth <<CV.AO T-SHIOTSUKA>>
#

INNUM=1
# 引数チェック
if [ $# -ne ${INNUM} ]; then
  echo "[ERROR]指定された引数は$#個です。" 1>&2
  echo "[ERROR]実行するには${INNUM}個の引数が必要です。" 1>&2
  exit 9
fi

ROOTDIR=/opt/cv-data
WAVDIR=${ROOTDIR}/dbWAV
WAVFILE=${WAVDIR}/$1.wav
WORKFILE=${ROOTDIR}/work/$1.wav

# インプットファイル存在確認
if [ ! -e ${WAVFILE} ]; then
  echo "[ERROR]${WAVFILE}がありません。"
  exit 9
fi 

echo "[INFO]WAVFILE:${WAVFILE}"

# 変換
echo "[INFO]Convert Start."
sox ${WAVFILE} -c 1 -r 16000 -b 16 ${WORKFILE}
#sox ${WAVFILE} -c 1 ${WORKFILE}
if [ ! -e ${WORKFILE} ]; then
  echo "[ERROR]変換後${WORKFILE}が出力されていません。"
  exit 9
fi
mv -f ${WORKFILE} ${WAVFILE}
echo "[INFO]Convert End."

# リスト作成
echo "${WAVFILE}" >> ${ROOTDIR}/work/wavfile.txt
