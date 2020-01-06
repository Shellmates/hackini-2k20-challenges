<?php
session_start();
session_destroy();
error_reporting(0);
header('Location: index.php');
exit();
?>


