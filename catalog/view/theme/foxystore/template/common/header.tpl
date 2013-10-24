<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">

<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
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

	<?php foreach ($links as $link) { ?>
		<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
	<?php } ?>
	
	<?php foreach ($styles as $style) { ?>
		<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
	<?php } ?>
	
	<?php foreach ($scripts as $script) { ?>
		<script type="text/javascript" src="<?php echo $script; ?>"></script>
	<?php } ?>
	
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
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
					<?php echo $language; ?>
					<?php echo $currency; ?>
				</div>
				<div class="col-lg-5 col-md-5 general-info hidden-sm hidden-xs">
					<a href="<?php echo $wishlist; ?>" class="wish-list-link">
						<span class="glyphicon glyphicon-heart"></span>
						<?php echo $text_wishlist; ?>
					</a>
					<a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a>
					<a href="<?php echo $account; ?>"><?php echo $text_account; ?></a>
					<a href="<?php echo $shopping_cart; ?>"><?php echo $text_shopping_cart; ?></a>
				</div>
				<div class="col-lg-4 visible-lg tR">
					<?php if (!$logged) { ?>
						<?php echo $text_welcome; ?>
					<?php } else { ?>
						<?php echo $text_logged; ?>
					<?php } ?>
				</div>
				<div class="col-md-4 col-sm-6 col-xs-12 hidden-lg tR">
					<?php if (!$logged) { ?>
						<?php echo $text_welcome; ?>
					<?php } else { ?>
						<?php echo $text_logged; ?>
					<?php } ?>
				</div>
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
			<div class="col-md-6 col-xs-12">
				<?php echo $cart; ?>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<nav class="navbar navbar-default" role="navigation">
					<div class="navbar-collapse hidden-xs">
						<ul class="nav navbar-nav">
							<?php foreach ($categories as $category) { ?>
								<li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
							<?php } ?>
						</ul>
						<form class="navbar-form navbar-left pull-right hidden-sm hidden-xs" role="search">
							<div class="form-group">
								<input type="text" name="search" class="form-control search" placeholder="<?php echo $text_search; ?>" value="<?php echo $search; ?>" autocomplete="off" />
							</div>
							<input type="submit" class="btn btn-default" value="">
							<div class="search-popup"></div>
						</form>
					</div>

					<div id="dl-menu" class="dl-menuwrapper visible-xs">
						<button class="pull-left">
							<div class="button-wrapper">
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</div>

							<span class="navbar-brand">Toggle menu</span>
						</button>
						<div class="button-wrapper-fix"></div>
						
						<ul class="dl-menu">
							<?php foreach ($categories as $category) { ?>
								<?php if ($category['children']) { ?>
									<li>
										<a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
										<ul class="dl-submenu">
											<li class="dl-back"><a href="#">back</a></li>
											<?php for ($i = 0; $i < count($category['children']);) { ?>
												<?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
												<?php for (; $i < $j; $i++) { ?>
													<?php if (isset($category['children'][$i])) { ?>
														<li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a></li>
													<?php } ?>
												<?php } ?>
											<?php } ?>
										</ul>
									</li>
								<?php } ?>
							<?php } ?>
						</ul>
					</div><!-- /dl-menuwrapper -->
				</nav>
			</div>
		</div>
	</header>