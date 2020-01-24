<?php
  $servername = 'sqli_baabyyyy_db';
  $username  = 'omega_coder';
  $password = 'omega_coder_was_here_1337';
  $database = 'sqli_baby_omega';

  $conn = new mysqli($servername, $username, $password, $database);

  if ($conn->connect_error) {
      die("Unable to connect to MYSQL server");
  }
?>