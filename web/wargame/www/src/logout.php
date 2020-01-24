<?php
session_start();
session_destroy();
header('Location: index.php');
exit();
error_reporting(0);
?>


