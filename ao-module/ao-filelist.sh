#!/bin/sh
#
# Dropbox Filelist
# auth <<CV.AO T-SHIOTSUKA>>
#

ROOTDIR=/opt/cv-data
RAWDIR=${ROOTDIR}/dbRAW
TEXTDIR=${ROOTDIR}/dbTEXT
WORKDIR=${ROOTDIR}/work

FILE1=${WORKDIR}/dbraw.list
FILE2=${WORKDIR}/dbtext.list
FILE3=${WORKDIR}/dbdiff.list

# ファイルリスト作成
echo "[INFO]Dropbox Filelist(dbRAW) Start.[${FILE1}]"
ls ${RAWDIR} | grep m4a | sed -e "s/\.m4a//" > ${FILE1}
echo "[INFO]Dropbox Filelist(dbRAW) End.[${FILE1}]"

echo "[INFO]Dropbox Filelist(dbTEXT) Start.[${FILE2}]"
ls ${TEXTDIR} | grep out | sed -e "s/\.out//" > ${FILE2}
echo "[INFO]Dropbox Filelist(dbTEXT) End.[${FILE2}]"

# リスト初期化
cat /dev/null > ${FILE3}

# 差分ファイル作成
echo "[INFO]Dropbox Filelist(dbDIFF) Start.[${FILE3}]"
diff ${FILE1} ${FILE2} | awk 'NR!=1' | awk '{print $2}' > ${FILE3}
echo "[INFO]Dropbox Filelist(dbDIFF) End.[${FILE3}]"
