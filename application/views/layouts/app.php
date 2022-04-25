<!doctype html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
	<meta name="generator" content="Jekyll v3.8.6">
	<title><?= isset($title) ? $title : "" ?>  TokoKeripik</title>

	<link rel="canonical" href="https://getbootstrap.com/docs/4.4/examples/navbar-fixed/">

	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&display=swap" rel="stylesheet">

	<!-- Bootstrap core CSS -->
	<link href="<?= base_url(); ?>/assets/libs/bootstrap/css/bootstrap.min.css" rel="stylesheet">

	<!-- Fontawesome CSS -->
	<link rel="stylesheet" href="<?= base_url(); ?>/assets/libs/font-awesome/css/all.min.css">

	<link rel="stylesheet" href="<?= base_url(); ?>/assets/css/app.css">
</head>

<body>
	<!-- Navbar -->
	<?php $this->load->view('layouts/_navbar') ?>
	<!-- End Navbar -->

	<div class="my-4">
		<!-- Content -->
		<?php $this->load->view($page) ?>
		<!-- End Content -->
	</div>

	<script src="<?= base_url(); ?>/assets/libs/jquery/jquery-3.4.1.min.js"></script>
	<script src="<?= base_url(); ?>/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="<?= base_url(); ?>/assets/libs/canvasjs/canvasjs.min.js"></script>
	<script src="<?= base_url(); ?>/assets/js/app.js"></script>
</body>

</html>
