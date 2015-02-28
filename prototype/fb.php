<?php

$filename = array();
$txt = array();
$str2=array();
$str3=array();

require_once("twitteroauth.php"); //twitteroauth.phpのパス。同一ディレクトリにOAuth.phpも設置する

// Consumer keyの値
$consumer_key = "wVvmFlZLPcwnggQYNAje2g";//IcqglEm5O2HLEACXqfGIg";
// Consumer secretの値
$consumer_secret = "DemIOKhodKMigw4EM0wtD9UbzhOk9ydQ5Pk9nEiCao";//MsIXYhwWDVKnE4YUQ003uM9ug8c5wmJkf4WfbZsXUzY";
// Access Tokenの値
$access_token = "2378800573-YsEudAPNFEKpavv4ILuPeUWyOvvMgOKRDZFebVl";//235477867-fsj4ar7rpKpZXxPrA5ZDtIvAPZxL8WIbkiQwsIiW";
// Access Token Secretの値
$access_token_secret = "OYpzdITkadorbCLR9YMJkR2AYMK973SLETmFy2NYaXzDk";//bf2aOm4uOipu4i0ZjeH5XvJXuOzf2d6ofVlTpEE101zzy";
// OAuthオブジェクト生成
$to = new TwitterOAuth($consumer_key,$consumer_secret,$access_token,$access_token_secret);

//$message = "自動投稿実験中";
$file = shell_exec ("find -mmin -2 -name '*.out' | grep 'a13'");
$filename = explode("./",$file);
$num = count($filename);
for($i=1;$i<$num;$i++){
	$txt[$i] = explode(".out",$filename[$i]);
}
for($i=1;$i<$num;$i++){
if(file_exists($txt[$i][0].'.out')){
	//$message = "";//自動投稿実験中";
	$str=file_get_contents($txt[$i][0].'.out');
	$str2 = explode("sentence1: ",$str);
	if(isset($str2[1])){
		$str3 = explode("wseq1:",$str2[1]);
		//echo $message."->".$str3[0];
		$message = $str3[0];
	}
	else{
		//echo $str;
	}
	//var_dump($str);
	//投稿
	//$req = $to->OAuthRequest("https://api.twitter.com/1.1/statuses/update.xml","POST",array("status"=>"$message"));
	$req = $to->OAuthRequest("https://api.twitter.com/1.1/statuses/update.json","POST",array("status" => $message));
	
	
	// レスポンスを表示する場合は下記コメントアウトを外す
	//header("Content-Type: application/xml");
	//echo $req;
}
else{
	echo "no";
}
}





?>
