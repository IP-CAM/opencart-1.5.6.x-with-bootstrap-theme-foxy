<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">

<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, maximum-scale=10.0, minimum-scale=0.25" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<base href="<?php echo $base; ?>" />
	
	<title><?php echo $title; ?></title>
	
	<?php if ($description) { ?>
		<meta name="description" content="<?php echo $description; ?>" />
	<?php } ?>
	
	<?php if ($keywords) { ?>
		<meta name="keywords" content="<?php echo $keywords; ?>" />
	<?php } ?>
	
	<?php if ($icon) { ?>
		<link href="<?php echo $icon; ?>" rel="icon" />
	<?php } ?>

	<script src="//code.jquery.com/jquery.js"></script>
	<link href="/catalog/view/theme/foxystore/css/vendor/bootstrap.min.css" rel="stylesheet" media="screen">
	<link href="/catalog/view/theme/foxystore/css/theme/style.css" rel="stylesheet">
	<link href="/catalog/view/theme/foxystore/css/theme/orange.css" rel="stylesheet">
	
	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
		<script src="/catalog/view/theme/foxystore/js/html5shiv.js"></script>
		<script src="/catalog/view/theme/foxystore/js/respond.min.js"></script>
	<![endif]-->
	
	<?php if ($stores) { ?>
		<script type="text/javascript"><!--
			$(document).ready(function() {
				<?php foreach ($stores as $store) { ?>
					$('body').prepend('<iframe src="<?php echo $store; ?>" style="display: none;"></iframe>');
				<?php } ?>
			});
		//--></script>
	<?php } ?>

	<?php echo $google_analytics; ?>
</head>

<body>
	<!-- Top line -->
	<div class="top-line">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-5 col-xs-12">
					<?php echo $language; ?>
					<?php echo $currency; ?>
				</div>
				<?php if ($logged): ?>
					<div class="col-lg-6 col-md-6 col-sm-7 sol-xs-12 general-info">
						<a href="<?php echo $wishlist; ?>" class="wish-list-link">
							<span class="glyphicon glyphicon-heart"></span>
							<?php echo $text_wishlist; ?>
						</a>
						<a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a>
						<a href="<?php echo $account; ?>"><?php echo $text_account; ?></a>
						<a href="<?php echo $shopping_cart; ?>"><?php echo $text_shopping_cart; ?></a>
					</div>
				<?php endif ?>
				<?php if ( ! $logged): ?>
					<div class="col-lg-6 col-md-6 col-sm-7 col-xs-12 visible-lg tR">
						<?php if (!$logged) { ?>
							<?php echo $text_welcome; ?>
						<?php } else { ?>
							<?php echo $text_logged; ?>
						<?php } ?>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-7 col-xs-12 hidden-lg tR">
						<?php if (!$logged) { ?>
							<?php echo $text_welcome; ?>
						<?php } else { ?>
							<?php echo $text_logged; ?>
						<?php } ?>
					</div>
				<?php endif ?>
			</div><!-- end .row -->
		</div><!-- end .container -->
	</div><!-- end .top-line -->

	<!-- Header -->
	<header id="header" class="container">
		<div class="row">
			<div class="col-md-6 col-xs-12">
				<?php if ($logo) { ?>
					<a href="<?php echo $home; ?>" class="logo pull-left">
						<img src="<?php echo $logo; ?>" width="313" height="135" title="<?php echo $name; ?>" alt="<?php echo $name; ?>">
					</a>
				<?php } else { ?>
					<a href="<?php echo $home; ?>" class="logo pull-left">
						<img src="/catalog/view/theme/foxystore/img/logo@2x.png" width="313" height="135" title="<?php echo $name; ?>" alt="<?php echo $name; ?>">
					</a>
				<?php } ?>
			</div>
			<div class="col-md-6 col-xs-12" id="header-mini-cart">
				<?php echo $cart; ?>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<nav class="navbar navbar-default top-menu" role="navigation">
					<div class="navbar-collapse visible-lg">
						<!-- Get static menu -->
						<?php Menu::call('demo'); ?>

						<form class="navbar-form navbar-left pull-right hidden-sm hidden-xs" role="search">
							<div class="form-group">
								<input type="text" name="search" class="form-control search" placeholder="<?php echo $text_search; ?>" value="<?php echo $search; ?>" autocomplete="off" />
							</div>
							<input type="submit" class="btn btn-default search-btn" value="">
							<div class="search-popup"></div>
						</form>
					</div>

					<!-- Get responsive menu -->
					<?php Menu::call('demo', 1); ?>
				</nav>
			</div>
		</div>
	</header>