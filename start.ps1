param (
	[switch]$Loop = $false
)

if(Test-Path "bin\php\php.exe"){
	$env:PHPRC = ""
	$binary = "bin\php\php.exe"
}else{
	$binary = "php"
}

if(Test-Path "EonMine.phar"){
	$file = "EonMine.phar"
}elseif(Test-Path "src\pocketmine\PocketMine.php"){
	$file = "src\pocketmine\PocketMine.php"
}elseif(Test-Path "Eon.phar"){
	echo "Welcome to EonMine"
	pause
	exit 1
}else{
	echo "Couldn't find a valid EonMine installation"
	pause
	exit 1
}

function StartServer{
	$command = "powershell " + $binary + " " + $file + " --enable-ansi"
	iex $command
}

$loops = 0

StartServer

while($Loop){
	if($loops -ne 0){
		echo ("Restarted " + $loops + " times")
	}
	$loops++
	echo "To escape the loop, press CTRL+C now. Otherwise, wait 5 seconds for the server to restart."
	echo ""
	Start-Sleep 5
	StartServer
}
