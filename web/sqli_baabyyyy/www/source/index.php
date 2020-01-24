<?php

if (isset($_GET['source'])) {
	die(highlight_file(__FILE__));
}

require("conf/db.conf.php");
error_reporting(0);

session_start();
if (isset($_POST['secret'])) {
	$query = $conn->prepare("INSERT INTO assrar_dawla(sid, sir_dawla) VALUES (?, ?)");
	$current_session_id = session_id();
	$query->bind_param('ss', $current_session_id, $_POST['secret']);
	$query->execute();
}

if (isset($_POST['session_id'])) {
    $query = "SELECT * FROM assrar_dawla WHERE sid = '" . $_POST['session_id'] . "'";
	$result = $conn->query($query);
} else {
	$query = "SELECT * FROM assrar_dawla WHERE sid = '" . session_id() . "'";
	$result = $conn->query($query);
}

?>

<!DOCTYPE HTML>
<html>
<head>
        <link href="/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div id="custom-bootstrap-menu" class="navbar navbar-default " role="navigation">
            <div class="container-fluid">
            <div class="navbar-header"><a class="navbar-brand" href="#">HackINI2k20 SecretVault</a>
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-menubuilder"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse navbar-menubuilder">
                <ul class="nav navbar-nav navbar-left">
                <li><a href="javascript:void(0);">Home</a>
                </li>
                </ul>
            </div>
            </div>
        </div>
        <div class="container-fluid">
		<?php
		if (isset($_POST['secret'])) {
			echo '<div class="alert alert-success" role="alert">We added your secret, you can view it using your session id : '. session_id() .'</div>';
		}
		?>
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-4">
				<form method="POST" action="index.php">
					<div class="input-group">
					  <input type="text" name="session_id" class="form-control" placeholder="Session id" aria-describedby="basic-addon2">
					  <span class="input-group-btn">
						<button class="btn btn-default" type="submit">Gimme my s3cr3t</button>
					 </span>
					</div>
				</form>
			</div>
			<div class="col-md-4">
				<form method="POST" action="index.php">

					<div class="input-group">
					  <input type="text" name="secret" class="form-control" placeholder="S3cretoo" aria-describedby="basic-addon2">
					  <span class="input-group-btn">
						<button class="btn btn-default" type="submit">Add</button>
					 </span>
					</div>
				</form>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>

	<br/>
	<br/>
	<br/>

        <div class="container-fluid">
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<div class="panel panel-default">
				  <div class="panel-heading"> :D :D  '''' أسرارك الشخصية</div>
				  <table class="table">
					<?php
					if (isset($result) && $result->num_rows > 0) {
					    while($row = $result->fetch_assoc()) {
						echo "<tr><td>" . htmlspecialchars($row['sir_dawla']) . "</td></tr>";
					    }
					} else {
						echo "<tr><td> :D :D ليست لديك اي اسرار يا اخي العزيز</td></tr>";
					}
					?>
				  </table>
				</div>
			</div>
			<div class="col-md-4"></div>
		</div>

        </div>

	<script
              src="/js/jquery-3.1.1.min.js"
    ></script>

        <script src="/js/bootstrap.min.js"></script>


</body>
</html>
