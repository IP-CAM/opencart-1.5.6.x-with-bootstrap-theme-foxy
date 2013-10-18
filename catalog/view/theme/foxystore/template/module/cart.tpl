<div class="mini-cart pull-right">
	<span><?php echo $text_items; ?></span>
	<a href="#" class="btn btn-default btn-md">
		<span class="glyphicon glyphicon-shopping-cart"></span>
	</a>

	<?php if ($products) { ?>
		<div class="mini-cart-popup">
			<ul class="cart-popup">
				<?php foreach ($products as $product) { ?>
					<li>
						<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>">
						<a href="<?php echo $product['href']; ?>" class="pull-left title"><?php echo $product['name']; ?></a>
						<span class="count pull-left">x <?php echo $product['quantity']; ?></span>
						<span class="price pull-left"><?php echo $product['total']; ?></span>
						<a class="close pull-left">&times;</a>
						<div class="product-options">
							<?php foreach ($product['option'] as $option) { ?>
								<div>- <?php echo $option['name']; ?> <?php echo $option['value']; ?></div>
							<?php } ?>
						</div>
					</li>
				<?php } ?>
			</ul>

			<div class="totals">
				<?php foreach ($totals as $total) { ?>
					<h6><?php echo $total['title']; ?>:<span><?php echo $total['text']; ?></span></h6>
				<?php } ?>
			</div>

			<div class="buttons">
				<a href="<?php echo $cart; ?>" class="btn btn-basket"><?php echo $text_cart; ?></a>
				<a href="<?php echo $checkout; ?>" class="btn btn-basket"><?php echo $text_checkout; ?></a>
			</div>
		</div>
	<?php } ?>
</div><!-- end .mini-cart -->