<?php echo $header; ?><?php echo $content_top; ?>

<?php echo $content_top; ?>

<!-- Content -->
<div class="container">
	<div class="row">
		<?php if (trim($column_left)): ?>
			<div class="col-lg-3 col-md-4 col-sm-4 hidden-xs">
				<?php echo $column_left; ?>
			</div>
			<div class="col-lg-9 col-md-8 col-sm-8 the-content account-page">
		<?php elseif (trim($column_right)): ?>
			<div class="col-lg-9 col-md-8 col-sm-8 the-content account-page">
		<?php else: ?>
			<div class="col-lg-12 the-content account-page">
		<?php endif ?>

			<!-- Breadcrumbs -->
			<div class="breadcrumb">
				<?php foreach ($breadcrumbs as $key => $breadcrumb) { ?>
					<?php if ($key == count($breadcrumbs) - 1): ?>
						<li><?php echo $breadcrumb['text']; ?></li>
					<?php else: ?>
						<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
					<?php endif ?>
				<?php } ?>
			</div>

			<!-- Title -->
			<h1><?php echo $heading_title; ?></h1>

			<!-- Content -->
			<ul class="account-list">
				<li><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
				<li><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
				<li><a href="<?php echo $address; ?>"><?php echo $text_address; ?></a></li>
				<li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
			</ul>
			<h2><?php echo $text_my_orders; ?></h2>
			<ul class="account-list">
				<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
				<li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
				<?php if ($reward) { ?>
				<li><a href="<?php echo $reward; ?>"><?php echo $text_reward; ?></a></li>
				<?php } ?>
				<li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
				<li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
			</ul>
			<h2><?php echo $text_my_newsletter; ?></h2>
			<ul class="account-list">
				<li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
			</ul>
		</div>
		<?php if (trim($column_right) AND ! trim($column_left)): ?>
			<div class="col-lg-3 col-md-4 col-sm-4 hidden-xs">
				<?php echo $column_right; ?>
			</div>
		<?php endif ?>
	</div>
</div>

<?php echo $content_bottom; ?><?php echo $footer; ?>