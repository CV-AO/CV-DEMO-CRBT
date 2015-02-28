#!/bin/sh
#
# Convert m4a to wav
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
INPUTDIR=${ROOTDIR}/dbRAW
OUTPUTDIR=${ROOTDIR}/dbWAV
INPUTFILE=${INPUTDIR}/$1.m4a
OUTPUTFILE=${OUTPUTDIR}/$1.wav

# インプットファイル存在確認
if [ ! -e ${INPUTFILE} ]; then
  echo "[ERROR]${INPUTFILE}がありません。"
  exit 9
fi 

echo "[INFO]INPUT:${INPUTFILE}"
echo "[INFO]OUTPUT:${OUTPUTFILE}"

# 変換
echo "[INFO]Convert Start."
ffmpeg -y -i ${INPUTFILE} ${OUTPUTFILE}
echo "[INFO]Convert End."
