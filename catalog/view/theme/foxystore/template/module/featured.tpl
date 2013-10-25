<?php if ($position == 'content_top' || $position == 'content_bottom'): ?>
<div class="container">
	<div class="row">
		<div class="col-md-12">
<?php endif; ?>

<h4 class="sidebar-heading"><?php echo $heading_title; ?></h4>
<div class="sidebar-block oH">
	<ul class="featured">
		<?php foreach ($products as $product) { ?>
			<li>
				<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>">
				<a class="title" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
				<span class="price">
					<?php if (!$product['special']) { ?>
						<?php echo $product['price']; ?>
					<?php } else { ?>
						<span class="price-new"><?php echo $product['special']; ?></span>
						<span class="price-old"><?php echo $product['price']; ?></span>
					<?php } ?>
				</span>
			</li>
		<?php } ?>
	</ul>
</div>

<?php if ($position == 'content_top' || $position == 'content_bottom'): ?>
		</div>
	</div>
</div>
<?php endif; ?>