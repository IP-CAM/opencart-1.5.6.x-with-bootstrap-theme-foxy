<div class="mini-cart pull-right">
	<span class="text-items"><?php echo $text_items; ?></span>
	<a href="<?php echo $cart; ?>" class="btn btn-default btn-md">
		<span class="glyphicon glyphicon-shopping-cart"></span>
	</a>

	<?php if ($products) { ?>
		<div class="mini-cart-popup">
			<div class="mini-cart-popup-inner">
				<table class="cart-popup">
					<?php foreach ($products as $product) { ?>
						<tr>
							<td class="image">
								<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>">
							</div>
							</td>
							<td class="title">
								<a href="<?php echo $product['href']; ?>" class="pull-left title"><?php echo htmlspecialchars_decode($product['name']); ?></a>
								<div class="product-options">
								<?php foreach ($product['option'] as $option) { ?>
									<div>- <?php echo $option['name']; ?> <?php echo $option['value']; ?></div>
								<?php } ?>
							</td>
							<td class="qty">
								<span class="count pull-left">x <?php echo $product['quantity']; ?></span>
							</td>
							<td class="total">
								<span class="price pull-left"><?php echo $product['total']; ?></span>
							</td>
							<td class="remove">
								<a class="close pull-left" data-product-key="<?php echo $product['key']; ?>">&times;</a>
							</td>
						</tr>
					<?php } ?>
				</table>

				<div class="totals pull-left w">
					<?php foreach ($totals as $total) { ?>
						<h6><b><?php echo $total['title']; ?>:</b><span><?php echo $total['text']; ?></span></h6>
					<?php } ?>
				</div>

				<div class="buttons">
					<a href="<?php echo $cart; ?>" class="btn btn-basket"><?php echo $text_cart; ?></a>
					<a href="<?php echo $checkout; ?>" class="btn btn-basket"><?php echo $text_checkout; ?></a>
				</div>
			</div>
		</div>
	<?php } else { ?>
		<div class="mini-cart-popup">
			<div class="mini-cart-popup-inner">
				<h5><?php echo $text_empty; ?></h5>
			</div>
		</div>
	<?php } ?>
</div><!-- end .mini-cart -->