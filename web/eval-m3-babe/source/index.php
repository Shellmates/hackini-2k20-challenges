<?php

if (isset($_GET['source'])) {
	die(highlight_file(__FILE__));
}

error_reporting(0);


?>

<!DOCTYPE HTML>
<html>
<head>
        <link href="/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div id="custom-bootstrap-menu" class="navbar navbar-default " role="navigation">
            <div class="container-fluid">
            <div class="navbar-header"><a class="navbar-brand" href="#">Evaal Me Babeeee</a>
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
		<div class="row">
			<div class="col-md-12">
                <a href="?source">Show Source Code</a>
				<form method="GET" action="index.php">
					<div class="input-group">
					  <input type="text" name="omega" class="form-control" placeholder="Babe" aria-describedby="basic-addon2">
					  <span class="input-group-btn">
						<button class="btn btn-default" type="submit">Eval me babe</button>
					 </span>
					</div>
				</form>
			</div>
		</div>
	</div>

	<br/>
	<br/>
	<br/>

        <div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
				  <div class="panel-heading">Eval result!</div>
				  <table class="table">
					<?php
                        function _filter________($black_listooo, $to_beeee_filtered){
                            foreach ($black_listooo as $black) {
                                if(stripos($to_beeee_filtered, $black) !== False) {
                                    die("Black Listed badd booyyy: $black\n");
                                }
                            }
                        }
                                                
                        if (isset($_GET["omega"])) {
                            $omega=@(string)$_GET['omega'];
                            $black_list = ["'", '"'];
                            _filter________($black_list, $omega);
                            
                            eval('$omega="'.addslashes($omega).'";');
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
