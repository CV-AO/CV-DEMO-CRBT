#!/bin/sh
#
# Convert wav to text by julius
# auth <<CV.AO T-SHIOTSUKA>>
#

ROOTDIR=/opt/cv-data
WAVDIR=${ROOTDIR}/dbWAV
TEXTDIR=${ROOTDIR}/dbTEXT
INPUTFILE=${ROOTDIR}/work/wavfile.txt

# インプットファイル存在確認
if [ ! -e ${INPUTFILE} ]; then
  echo "[ERROR]${INPUTFILE}がありません。"
  exit 9
fi 

# pulseaudio 起動
pulseaudio --start

# 変換
echo "[INFO]Convert Start."
julius -nostrip -C /opt/cv/dictation-kit/main.jconf -C /opt/cv/dictation-kit/am-gmm.jconf -input rawfile -filelist ${INPUTFILE} -charconv utf-8 utf-8 -outfile
#julius -smpFreq 44100 -nostrip -C /opt/cv/dictation-kit/main.jconf -C /opt/cv/dictation-kit/am-gmm.jconf -input rawfile -filelist ${INPUTFILE} -charconv utf-8 utf-8 -outfile
mv -f ${WAVDIR}/*.out ${TEXTDIR}
echo "[INFO]Convert End."
cat /dev/null > ${INPUTFILE}
