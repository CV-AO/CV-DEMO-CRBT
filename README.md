# CV-DEMO-CRBT
This is CV-DEMO core batch repository.  
Set directory '/opt/cv/ao-module'.  

# モジュール一覧
- モジュール（★は環境へのインストールが必要）  
　/opt/cv/  
　┗ julius----------音声解析コア（★）  
　┗ dictation-kit----------音声書き起こしコア（★）    
　┗ ffmpeg_sources----------コーデック変換（★）  
　┗ ao-module  
　　　┗ dropbox.py----------dropbox同期起動停止スクリプト  
　　　┗ ao-modulepack.sh----------音声解析モジュールパッケージ  
　　　┗ ao-filelist.sh----------未処理音声ファイル一覧作成  
　　　┗ ao-m4a2wav.sh----------音声ファイルフォーマット変換  
　　　┗ ao-sox.sh----------音声ファイルコーデック変換  
　　　┗ ao-wav2text.sh----------音声テキスト変換  
  
- 常駐コマンド  
　> cd /opt/cv/ao-module/log  
　> nohup sudo /opt/cv/ao-module/ao-main.sh > out.log 2> err.log &  
　  
- DropBoxデータ  
　/opt/cv-data/  
　┗ dbRAW----------ネイティブアプリからアップロードされる音声ファイル  
　┗ dbWAV----------コーデック変換済み音声ファイル  
　┗ dbTEXT----------音声解析済みテキストファイル  
