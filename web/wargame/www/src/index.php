<?php
    session_start();
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>myTask 2</title>
                <style>
                #formulaire input { margin-bottom:10px; }
                a { color:black; }
                p { font-size:1.2em; }
                a { color:cyan }
                h3 { color:green }
                </style>
    </head>

    <body style="background-image: url('logo.png');">
        <div style="color:white; background-color:black; text-align:center; border: 3px gray dotted;  width:600px;  height:200px; margin:auto; margin-top:200px; padding:10px;">
        <h3 style="font-family:Comic Sans MS; ">ESI Portal v1.0 (BETA)</h3>


<?php
error_reporting(0);
error_log(0);
require_once ('dbconf.php');

$form = true;
$error = '';

if (isset($_POST['login']) && isset($_POST['password']) && !empty($_POST['login']) && !empty($_POST['password']))
{
    if (isset($_SESSION['token']) and isset($_POST['token']) and !empty($_SESSION['token']) and !empty($_POST['token']))
    {
        if ($_SESSION['token'] == $_POST['token'])
        {
            $login = mysqli_real_escape_string($conn, $_POST['login']);
            $password = $_POST['password'];

            if (stripos($password, 'or') !== false || stripos($password, 'and') !== false || strpos($password, 'union') !== false || strpos($password, 'select') !== false || strpos($password, 'join') !== false || strpos($password, 'from') !== false || strpos($password, 'substring') !== false || strpos($password, 'ascii') !== false || strpos($password, 'length') !== false || strpos($password, 'where') !== false)
            {
                $error = "Attack Detected\n";
            }
            else
            {
                $sql = "SELECT * from users WHERE login='$login' AND pass=md5('$password')";
                $resultat = mysqli_query($conn, $sql);

                $donnees = mysqli_fetch_assoc($resultat);
                if ($resultat && $resultat->num_rows != 0)
                {
                    $_SESSION['login'] = $donnees['login'];
                    mysqli_free_result($resultat);
                }
                else $error = "Bad credentials\n";
            }

            if (isset($_SESSION['login']))
            {
                $form = false;
                echo "<p>Welcome <span style=\"font-style:italic; color:yellow;\">" . $_SESSION['login'] . "</span> </p>";
                if ($_SESSION['login'] === 'admin') echo "<p>Click <a href=\"8ffeb5d5f38e6d071b38cfe05b5099e7/index.php\">here</a> to manage your website</p>";
                else echo "<p><span style=\"font-style:italic; color:yellow;\">admin</span> : This website is under construction. Come back soon !</p>";

                echo "<p> <a href=\"logout.php\"><input type=\"button\" value=\"Log off\"></a></p>";
            }
        }
        else $error = "Invalid token\n";
    }
}

if ($form)
{

    //On enregistre notre token
    $token = bin2hex(random_bytes(32));
    $_SESSION['token'] = $token;

?>
<div id="formulaire">
<form method="post" action="index.php">
<p>
        Login ID : <input type="text" name="login" required /><br/>
    Password : <input type="password" name="password" required /> </br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Sign in" /> <input type="reset" value="Clear" /><br/>
        <?php if ($error) echo "<span style=\"color:red; text-align:center;\">" . $error . "</span>"; ?><br/>
        <span style="text-align:center; font-size:0.8em; color:white;">Powered by <a href="mailto:brahimi.zakaria@outlook.fr">B.Zakaria</a></span>
    <input type="hidden" name="token" id="token" value="<?php echo $token; ?>" />
</p>
</form>
</div>
<?php
}
?>
</div>

</body>
</html>

