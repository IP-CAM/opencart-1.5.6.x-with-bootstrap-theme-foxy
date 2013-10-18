<?php echo $header; ?>

<!-- Content -->
<div class="container">
	<div class="row">
		<div class="col-lg-3 col-md-4 col-sm-4">
			<?php echo $column_left; ?>
		</div>
		<div class="col-lg-9 col-md-8 col-sm-8 the-content">

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
			<?php echo $text_message; ?>

			<div class="buttons">
				<div class="right">
					<a href="<?php echo $continue; ?>" class="btn btn-basket"><?php echo $button_continue; ?></a>
				</div>
			</div>
		</div>
	</div>
</div>

<?php echo $footer; ?>