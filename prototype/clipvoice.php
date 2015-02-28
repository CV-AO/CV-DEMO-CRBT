<?php
$filename = array();
$txt = array();
$file = shell_exec ("find -mmin -3 -name '*.wav' | grep 'a13'");
$filename = explode("./",$file);
$num = count($filename);
echo $num;
for($i=1;$i<$num;$i++){
	$txt[$i] = explode(".out",$filename[$i]);
}
$fp = fopen("/home/kumagai/dictation-kit-v4.3.1-linux/filelist.txt", "w");
for($i=1;$i<$num;$i++){
if(!file_exists($txt[$i][0].'.out')){
	fwrite($fp, $txt[$i][0].".wav\r\n");
}
else{
	echo "no";
}
}
fclose($fp);





?>
