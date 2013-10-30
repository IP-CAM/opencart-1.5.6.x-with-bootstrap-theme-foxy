<?php echo $header; ?><?php echo $content_top; ?>

<!-- Content -->
<div class="container">
	<div class="row">
		<?php if (trim($column_left)): ?>
			<div class="col-lg-3 col-md-4 col-sm-4 hidden-xs">
				<?php echo $column_left; ?>
			</div>
			<div class="col-lg-9 col-md-8 col-sm-8 the-content">
		<?php elseif (trim($column_right)): ?>
			<div class="col-lg-9 col-md-8 col-sm-8 the-content">
		<?php else: ?>
			<div class="col-lg-12 the-content">
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

			<!-- Catalog view -->
			<div class="row catalog-view">
				<div class="col-lg-5 col-md-12 col-sm-12 col-xs-12">
					<a href="#" id="catalog-grid-view" class="active hidden-xs">
						<span class="glyphicon glyphicon-th-large"></span><?php echo $text_grid ?>
					</a>
					<a href="#" id="catalog-list-view" class="hidden-xs">
						<span class="glyphicon glyphicon-th-list"></span><?php echo $text_list; ?>
					</a>

					<a href="<?php echo $compare; ?>" class="compare-link pull-right hidden-xs"><?php echo $text_compare; ?></a>
				</div>
				<div class="col-lg-7 col-md-12 col-sm-12 col-xs-12">
					<div class="show-number">
						<span><?php echo $text_limit; ?></span>
						<select class="dropup show-tick show-menu-arrow" onchange="location = this.value;">
							<?php foreach ($limits as $limits) { ?>
							<?php if ($limits['value'] == $limit) { ?>
							<option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
							<?php } else { ?>
							<option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
							<?php } ?>
							<?php } ?>
						</select>
					</div>

					<div class="sort-order">
						<span><?php echo $text_sort; ?></span>
						<select class="dropup show-tick show-menu-arrow" onchange="location = this.value;">
							<?php foreach ($sorts as $sorts) { ?>
							<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
							<option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
							<?php } else { ?>
							<option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
							<?php } ?>
							<?php } ?>
						</select>
					</div>
				</div>
			</div><!-- end .catalog-view -->

			<!-- Products -->
			<?php if ($products) { ?>
				<div class="row catalog" id="products-grid-container">

					<?php foreach ($products as $product) { ?>
						<!-- Check if product is already in wishlist -->
						<?php 
							$in_compare = 
								isset($this->session->data['compare']) 
								? in_array($product['product_id'], $this->session->data['compare']) 
								: false;

							$in_wishlist = 
								isset($this->session->data['wishlist']) 
								? in_array($product['product_id'], $this->session->data['wishlist']) 
								: false;
						?>

						<?php if ( ! trim($column_left) AND ! trim($column_right)): ?>
							<div class="product-preview-block-<?php echo $product['product_id']; ?> col-lg-3 col-md-4 col-sm-4">
						<?php else: ?>
							<div class="product-preview-block-<?php echo $product['product_id']; ?> col-lg-4 col-md-6 col-sm-6">
						<?php endif ?>
							<div class="img-holder">
								<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" title="" alt=""></a>
								<a href="#" class="quick-view-btn btn hidden-xs">Quick view</a>
							</div>
							<a href="<?php echo $product['href']; ?>" class="title"><?php echo $product['name']; ?></a>
							<hr class="short">
							<span class="cat">Mp3 players</span>
							<span class="actual-price pR">
								<?php if ($product['price']) { ?>
									<div class="price">
										<?php if (!$product['special']) { ?>
											<?php echo $product['price']; ?>
										<?php } else { ?>
											<?php echo $product['special']; ?>
											<span class="sale-price"><?php echo $product['price']; ?></span>
										<?php } ?>
									</div>
								<?php } ?>
							</span>

							<!-- Add to cart btn -->
							<a href="#" onclick="addToCart('<?php echo $product['product_id']; ?>'); return false;" class="btn btn-basket"><span class="glyphicon glyphicon-shopping-cart"></span><?php echo $button_cart; ?></a>

							<!-- Product icons -->
							<div class="product-icon-holder">
								<!-- Add to wishlist btn -->
								<?php if ($in_wishlist): ?>
									<a href="#" data-product-id="<?php echo $product['product_id']; ?>" class="active rounded-icon fav tooltiped" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" data-placement="left"><span class="glyphicon glyphicon-heart"></span></a>
								<?php else: ?>
									<a href="#" data-product-id="<?php echo $product['product_id']; ?>" class="rounded-icon fav tooltiped" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" data-placement="left"><span class="glyphicon glyphicon-heart"></span></a>
								<?php endif ?>

								<!-- Add to compare btn -->
								<?php if ($in_compare): ?>
									<a href="#" data-product-id="<?php echo $product['product_id']; ?>" class="active rounded-icon compare tooltiped" data-toggle="tooltip" title="<?php echo $button_compare; ?>" data-placement="left"><span class="glyphicon glyphicon-stats"></span></a>
								<?php else: ?>
									<a href="#" data-product-id="<?php echo $product['product_id']; ?>" class="rounded-icon compare tooltiped" data-toggle="tooltip" title="<?php echo $button_compare; ?>" data-placement="left"><span class="glyphicon glyphicon-stats"></span></a>
								<?php endif ?>
							</div>

							<!-- Product quick view -->
							<div class="quick-product-info hidden-xs">
								<div class="col-lg-12 the-content">
									<div class="row product-info">
										<div class="col-lg-6 col-md-6 col-sm-12">
											<?php if ($product['images']) { ?>
												<div class="quick-prouct-image-lg-<?php echo $product['product_id']; ?> quick-prouct-image-lg prouct-image-lg">
													<div class="quick-prouct-image-lg-id">
														<a href="<?php echo $product['popup']; ?>" title="<?php echo $heading_title; ?>"><img src="<?php echo $product['popup']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
														<?php foreach ($product['images'] as $product_image) { ?>
															<a href="<?php echo $product_image['popup']; ?>" title="<?php echo $heading_title; ?>"><img src="<?php echo $product_image['popup']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
														<?php } ?>
													</div>
													<a href="#" class="quick-prouct-image-lg-prev quick-prouct-image-lg-navigation hidden-sm"><span class="glyphicon glyphicon-chevron-left"></span></a>
													<a href="#" class="quick-prouct-image-lg-next quick-prouct-image-lg-navigation hidden-sm"><span class="glyphicon glyphicon-chevron-right"></span></a>
												</div>
											<?php } ?>
										</div>
										<div class="product-preview-block-popup-<?php echo $product['product_id']; ?> col-lg-6 col-md-6 col-sm-12">
											<h1><?php echo $product['name']; ?></h1>

											<hr class="short">

											<!-- Prices -->
											<?php if ($product['price']) { ?>
												<div class="price">
													<?php if (!$product['special']) { ?>
														<span class="actual"><?php echo $product['price']; ?></span>
													<?php } else { ?>
														<div class="actual"><?php echo $product['price']; ?></div>
														<div class="discount"><?php echo $product['special']; ?></div>
													<?php } ?>

													<?php if ($product['points']) { ?>
														<div class="tax"><?php echo $text_points; ?> <?php echo $product['points']; ?></div>
													<?php } ?>
													
													<?php if ($product['tax']) { ?>
														<span class="tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
													<?php } ?>

													<?php if ($product['discounts']) { ?>
														<hr class="small" />

														<div class="tax">
															<?php foreach ($product['discounts'] as $discount) { ?>
																<?php echo sprintf($text_discount, $discount['quantity'], $discount['price']); ?><br />
															<?php } ?>
														</div>
													<?php } ?>
												</div>
											<?php } ?>

											<!-- Rating -->
											<div class="review-info">
												<span class="rating"><img src="/catalog/view/theme/foxystore/img/product-rating-<?php echo $product['rating']; ?>.png"></span>
												<span class="total"><?php echo $product['reviews']; ?></span>
											</div>

											<!-- Attributes -->
											<div class="attrs pull-left w">
												<!-- Manufacturer -->
												<?php if ($product['manufacturer']) { ?>
													<div class="col-sm-4 col-xs-6 dark"><?php echo $text_manufacturer; ?></div>
													<div class="col-sm-8 col-xs-6"><a href="<?php echo $product['manufacturers']; ?>"><?php echo $product['manufacturer']; ?></a></div>
												<?php } ?>

												<!-- Model -->
												<div class="col-sm-4 col-xs-6 dark"><?php echo $text_model; ?></div>
												<div class="col-sm-8 col-xs-6"><?php echo $product['model']; ?></div>

												<!-- Reward -->
												<?php if ($product['reward']) { ?>
													<div class="col-sm-4 col-xs-6 dark"><?php echo $text_reward; ?></div>
													<div class="col-sm-8 col-xs-6"><?php echo $product['reward']; ?></div>
												<?php } ?>

												<!-- Stock -->
												<div class="col-sm-4 col-xs-6 dark"><?php echo $text_stock; ?></div>
												<div class="col-sm-8 col-xs-6"><span class="green"><?php echo $product['stock']; ?></span></div>
											</div>


											<!-- PRICE BOX -->
											<div class="price-box pull-left w">
												<div class="col-sm-6 col-xs-12 pull-left">
													<span class="pull-left"><?php echo $text_qty; ?></span>
													<div class="input-type-number">
														<input type="number" value="<?php echo $product['minimum']; ?>" min="<?php echo $product['minimum']; ?>" class="number">
														<a href="#" class="up" data-num="1"></a>
														<a href="#" class="down" data-num="-1"></a>
													</div>
												</div>
												<div class="col-sm-6 col-xs-12 pull-left">
													<a href="#" class="btn btn-basket" onclick="addToCart('<?php echo $product['product_id']; ?>'); return false;">
														<span class="glyphicon glyphicon-shopping-cart"></span>
														<?php echo $button_cart; ?>
													</a>
												</div>
											</div>

											<!-- Wishlist btn -->
											<!-- Check if product is already in wishlist -->
											<?php 
												$in_compare = 
													isset($this->session->data['compare']) 
													? in_array($product['product_id'], $this->session->data['compare']) 
													: false;

												$in_wishlist = 
													isset($this->session->data['wishlist']) 
													? in_array($product['product_id'], $this->session->data['wishlist']) 
													: false;
											?>

											<div class="buttons pull-left w">
												<!-- Compare btn -->
												<?php if ($in_compare): ?>
													<a href="#" data-product-id="<?php echo $product['product_id']; ?>" class="compare active action-button btn btn-grey col-xs-12 col-sm-4">
														<span class="glyphicon glyphicon-stats"></span>
														<?php echo $button_compare; ?>
													</a>
												<?php else: ?>
													<a href="#" data-product-id="<?php echo $product['product_id']; ?>" class="compare action-button btn btn-grey col-xs-12 col-sm-4">
														<span class="glyphicon glyphicon-stats"></span>
													<?php echo $button_compare; ?>
													</a>
												<?php endif ?>

												<!-- Wishlist btn -->
												<?php if ($in_wishlist): ?>
													<a href="#" data-product-id="<?php echo $product['product_id']; ?>" class="active fav action-button btn btn-grey col-xs-12 col-sm-4">
														<span class="glyphicon glyphicon-heart"></span>
														<?php echo $button_wishlist; ?>
													</a>
												<?php else: ?>
													<a href="#" data-product-id="<?php echo $product['product_id']; ?>" class="fav action-button btn btn-grey col-xs-12 col-sm-4">
														<span class="glyphicon glyphicon-heart"></span>
														<?php echo $button_wishlist; ?>
													</a>
												<?php endif ?>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					<?php } ?>
				</div>
			<?php } ?>
			
			<!-- Pagination -->
			<div class="row pagination-row">
				<?php echo $pagination; ?>
			</div>

			<!-- No categories or products -->
			<?php if (!$products) { ?>
				<h3><?php echo $text_empty; ?></h3>
				<a href="<?php echo $continue; ?>" class="btn btn-basket pull-right"><?php echo $button_continue; ?></a>
			<?php } ?>
		</div>
		<?php if (trim($column_right) AND ! trim($column_left)): ?>
			<div class="col-lg-3 col-md-4 col-sm-4 hidden-xs">
				<?php echo $column_right; ?>
			</div>
		<?php endif ?>
	</div>
</div>


<script type="template/x-handlebars" id="product-list-view" id="products-list-container">
<?php if ( ! trim($column_left) AND ! trim($column_right)): ?>
	<div class="row catalog-list catalog-list-large" id="products-list-container">
<?php else: ?>
	<div class="row catalog-list">
<?php endif ?>

	{{#each products}}
		<div class="product-preview-block-{{product_id}} col-lg-12">
			<!-- Image -->
			<div class="img-holder col-lg-3 col-md-3 col-sm-3">
				<a href="{{escape href}}"><img src="{{thumb}}" title="" alt=""></a>
				<a href="#" class="quick-view-btn btn hidden-xs">Quick view</a>
			</div>

			<!-- Title container -->
			<div class="pull-left title-container col-lg-6 col-md-6 col-sm-6">
				<a href="{{escape href}}" class="title hh">{{escape name}}</a>
				<hr class="short">
				<span class="cat">Mp3 players</span>

				<!-- Description -->
				<p class="visible-lg">{{description}}</p>

				<div class="buttons pull-left w">
					<!-- Compare btn -->
					{{#in_list product_id 'compare' '<?php echo $button_compare; ?>'}}{{/in_list}}

					<!-- Wishlist btn -->
					{{#in_list product_id 'fav' '<?php echo $button_wishlist; ?>'}}{{/in_list}}
				</div>
			</div>

			<!-- Price container -->
			<div class="price-container col-lg-3 col-md-3 col-sm-3">
				<!-- Prices -->
				<span class="actual-price pR">
					{{#if price }}
						<div class="price">
							{{#if special}}
								{{special}}
								<span class="sale-price">{{price}}</span>
							{{else}}
								{{price}}
							{{/if}}
						</div>
					{{/if}}
				</span>

				<!-- Add to cart btn -->
				<a href="#" onclick="addToCart('{{product_id}}'); return false;" class="btn btn-basket"><span class="glyphicon glyphicon-shopping-cart"></span><span><?php echo $button_cart; ?></span></a>
			</div>

			<!-- Product quick view -->
			<div class="quick-product-info hidden-xs">
				<div class="col-lg-12 the-content">
					<div class="row product-info">
						<div class="col-lg-6 col-md-6 col-sm-12">
							{{#if images}}
								<div class="quick-prouct-image-lg-{{product_id}} quick-prouct-image-lg prouct-image-lg">
									<div class="quick-prouct-image-lg-id">
										<a href="{{escape popup}}"><img src="{{escape popup}}" /></a>
										{{#each images}}
											<a href="{{escape popup}}"><img src="{{escape popup}}" /></a>
										{{/each}}
									</div>
									<a href="#" class="quick-prouct-image-lg-prev quick-prouct-image-lg-navigation hidden-sm"><span class="glyphicon glyphicon-chevron-left"></span></a>
									<a href="#" class="quick-prouct-image-lg-next quick-prouct-image-lg-navigation hidden-sm"><span class="glyphicon glyphicon-chevron-right"></span></a>
								</div>
							{{/if}}
						</div>
						<div class="product-preview-block-popup-{{product_id}} col-lg-6 col-md-6 col-sm-12">
							<h1>{{escape name}}</h1>

							<hr class="short">

							<!-- Prices -->
							{{#if price}}
								<div class="price">
									{{#if special}}
										<div class="actual">{{price}}</div>
										<div class="discount">{{special}}</div>
									{{else}}
										<span class="actual">{{price}}</span>
									{{/if}}

									{{#if points}}
										<div class="tax"><?php echo $text_points; ?> {{points}}</div>
									{{/if}}
									
									{{#if tax}}
										<span class="tax"><?php echo $text_tax; ?> {{tax}}</span>
									{{/if}}

									{{#if discounts}}
										<hr class="small" />

										<div class="tax">
											{{#each discounts}}
												{{product_discount '<?php echo $text_discount; ?>' quantity price}}<br>
											{{/each}}
										</div>
									{{/if}}
								</div>
							{{/if}}

							<!-- Rating -->
							<div class="review-info">
								<span class="rating"><img src="/catalog/view/theme/foxystore/img/product-rating-{{rating}}.png"></span>
								<span class="total">{{reviews}}</span>
							</div>

							<!-- Attributes -->
							<div class="attrs pull-left w">
								<!-- Manufacturer -->
								<?php if ($product['manufacturer']) { ?>
									<div class="col-sm-4 col-xs-6 dark"><?php echo $text_manufacturer; ?></div>
									<div class="col-sm-8 col-xs-6"><a href="{{escape manufacturers}}">{{manufacturer}}</a></div>
								<?php } ?>

								<!-- Model -->
								<div class="col-sm-4 col-xs-6 dark"><?php echo $text_model; ?></div>
								<div class="col-sm-8 col-xs-6">{{model}}</div>

								<!-- Reward -->
								<?php if ($product['reward']) { ?>
									<div class="col-sm-4 col-xs-6 dark"><?php echo $text_reward; ?></div>
									<div class="col-sm-8 col-xs-6">{{reward}}</div>
								<?php } ?>

								<!-- Stock -->
								<div class="col-sm-4 col-xs-6 dark"><?php echo $text_stock; ?></div>
								<div class="col-sm-8 col-xs-6"><span class="green">{{stock}}</span></div>
							</div>


							<!-- PRICE BOX -->
							<div class="price-box pull-left w">
								<div class="col-sm-6 col-xs-12 pull-left">
									<span class="pull-left"><?php echo $text_qty; ?></span>
									<div class="input-type-number">
										<input type="number" value="{{minimum}}" min="{{minimum}}" class="number">
										<a href="#" class="up" data-num="1"></a>
										<a href="#" class="down" data-num="-1"></a>
									</div>
								</div>
								<div class="col-sm-6 col-xs-12 pull-left">
									<a href="#" class="btn btn-basket" onclick="addToCart('{{product_id}}'); return false;">
										<span class="glyphicon glyphicon-shopping-cart"></span>
										<?php echo $button_cart; ?>
									</a>
								</div>
							</div>

							<div class="buttons pull-left w">
								<!-- Compare btn -->
								{{#in_list product_id 'compare' '<?php echo $button_compare; ?>'}}{{/in_list}}

								<!-- Wishlist btn -->
								{{#in_list product_id 'fav' '<?php echo $button_wishlist; ?>'}}{{/in_list}}
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	{{/each}}
</div>
</script>

<script type="text/javascript">
	var products = {};

	products.products = <?php echo json_encode($products); ?>;

	<?php if (isset($this->session->data['compare'])): ?>
		products.compare_list = <?php echo json_encode($this->session->data['compare']); ?>;
	<?php endif; ?>

	<?php if (isset($this->session->data['wishlist'])): ?>
		products.wish_list = <?php echo json_encode($this->session->data['wishlist']); ?>;
	<?php endif; ?>
	

	window.products = products;
</script>

<?php echo $content_bottom; ?><?php echo $footer; ?>