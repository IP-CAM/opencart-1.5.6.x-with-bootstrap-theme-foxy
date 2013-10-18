<?php // print_r($images); die(); ?>

<?php echo $header; ?>

<!-- Check if product is already in wishlist -->
<?php 
	$in_compare = in_array($product_id, $this->session->data['compare']);
	$in_wishlist = in_array($product_id, $this->session->data['wishlist']);
?>

<!-- Content -->
<div class="container">
	<div class="row">
		<div class="col-lg-3 col-md-4 col-sm-4">
			<?php echo $column_left; ?>
		</div>
		<div class="product-preview-block-<?php echo $product_id; ?> col-lg-9 col-md-8 col-sm-8 the-content">
			<div class="row product-info">
				<div class="col-lg-6">

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

					<h1 class="hidden-lg"><?php echo $heading_title; ?></h1>
					<hr class="short hidden-lg">

					<!-- Prices -->
					<?php if ($price) { ?>
						<div class="price hidden-lg">
							<?php if (!$special) { ?>
								<span class="actual"><?php echo $price; ?></span>
							<?php } else { ?>
								<div class="actual"><?php echo $price; ?></div>
								<div class="discount"><?php echo $special; ?></div>
							<?php } ?>

							<?php if ($points) { ?>
								<div class="tax"><?php echo $text_points; ?> <?php echo $points; ?></div>
							<?php } ?>
							
							<?php if ($tax) { ?>
								<span class="tax"><?php echo $text_tax; ?> <?php echo $tax; ?></span>
							<?php } ?>

							<?php if ($discounts) { ?>
								<hr class="small" />

								<div class="tax">
									<?php foreach ($discounts as $discount) { ?>
										<?php echo sprintf($text_discount, $discount['quantity'], $discount['price']); ?><br />
									<?php } ?>
								</div>
							<?php } ?>
						</div>
					<?php } ?>

					<!-- Product images -->
					<?php if ($thumb || $images) { ?>
						<div class="prouct-image-lg">
							<div id="prouct-image-lg">
								<?php if ($popup && $thumb) { ?>
									<a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>"><img src="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
								<?php } ?>

								<?php if ($images) { ?>
									<?php foreach ($images as $image) { ?>
										<a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>"><img src="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
									<?php } ?>
								<?php } ?>
							</div>
						</div>
						<ul class="product-images" id="product-images-thumbs">
							<?php if ($popup && $thumb) { ?>
								<li><a href="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>
							<?php } ?>

							<?php if ($images) { ?>
								<?php foreach ($images as $image) { ?>
									<li><a href="#" title="<?php echo $heading_title; ?>"><img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>
								<?php } ?>
							<?php } ?>
						</ul>
					<?php } ?>
				</div>
				<div class="col-lg-6">
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

					<h1 class="visible-lg"><?php echo $heading_title; ?></h1>
					<hr class="short visible-lg">

					<!-- Prices -->
					<?php if ($price) { ?>
						<div class="price visible-lg">
							<?php if (!$special) { ?>
								<span class="actual"><?php echo $price; ?></span>
							<?php } else { ?>
								<div class="actual"><?php echo $price; ?></div>
								<div class="discount"><?php echo $special; ?></div>
							<?php } ?>

							<?php if ($points) { ?>
								<div class="tax"><?php echo $text_points; ?> <?php echo $points; ?></div>
							<?php } ?>
							
							<?php if ($tax) { ?>
								<span class="tax"><?php echo $text_tax; ?> <?php echo $tax; ?></span>
							<?php } ?>

							<?php if ($discounts) { ?>
								<hr class="small" />

								<div class="tax">
									<?php foreach ($discounts as $discount) { ?>
										<?php echo sprintf($text_discount, $discount['quantity'], $discount['price']); ?><br />
									<?php } ?>
								</div>
							<?php } ?>
						</div>
					<?php } ?>

					<!-- Rating -->
					<div class="review-info">
						<span class="rating"><img src="/catalog/view/theme/foxystore/img/product-rating-<?php echo $rating; ?>.png"></span>
						<span class="total"><?php echo $reviews; ?></span>
						<span class="new"><a href="#" id="write-new-review"><?php echo $text_write; ?></a></span>
					</div>

					<!-- Attrs -->
					<div class="attrs pull-left w">
						<!-- Manufacturer -->
						<?php if ($manufacturer) { ?>
							<div class="col-sm-4 col-xs-6 dark"><?php echo $text_manufacturer; ?></div>
							<div class="col-sm-8 col-xs-6"><a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></div>
						<?php } ?>

						<!-- Model -->
						<div class="col-sm-4 col-xs-6 dark"><?php echo $text_model; ?></div>
						<div class="col-sm-8 col-xs-6"><?php echo $model; ?></div>

						<!-- Reward -->
						<?php if ($reward) { ?>
							<div class="col-sm-4 col-xs-6 dark"><?php echo $text_reward; ?></div>
							<div class="col-sm-8 col-xs-6"><?php echo $reward; ?></div>
						<?php } ?>

						<!-- Stock -->
						<div class="col-sm-4 col-xs-6 dark"><?php echo $text_stock; ?></div>
						<div class="col-sm-8 col-xs-6"><span class="green"><?php echo $stock; ?></span></div>
					</div>

					<!-- Options -->
					<div class="options pull-left w" id="product-options">
						<h3><?php echo $text_option; ?></h3>

						<form>
							<table class="w">
								
								<!-- PROFILES -->
								<?php if ($profiles): ?>
									<tr>
										<td><span class="required">*</span> <?php echo $text_payment_profile ?></td>
										
										<td>
											<select name="profile_id">
												<option value=""><?php echo $text_select; ?></option>
												<?php foreach ($profiles as $profile): ?>
												<option value="<?php echo $profile['profile_id'] ?>"><?php echo $profile['name'] ?></option>
												<?php endforeach; ?>
											</select>
										</td>

										<span id="profile-description"></span>
									</tr>
								<?php endif; ?>

								<?php foreach ($options as $option) { ?>

									<!-- SELECT -->
									<?php if ($option['type'] == 'select') { ?>
										<tr id="option-<?php echo $option['product_option_id']; ?>">
											<td>
												<?php if ($option['required']) { ?>
													<span>*</span>
												<?php } ?>
												<?php echo $option['name']; ?>:
											</td>
											<td>
												<select name="option[<?php echo $option['product_option_id']; ?>]" class="dropup show-tick show-menu-arrow">
													<option value=""><?php echo $text_select; ?></option>
													<?php foreach ($option['option_value'] as $option_value) { ?>
														<option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
														<?php if ($option_value['price']) { ?>
														(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
														<?php } ?>
														</option>
													<?php } ?>
												</select>
											</td>
										</tr>
									<?php } ?>

									<!-- RADIO -->
									<?php if ($option['type'] == 'radio') { ?>
										<tr id="option-<?php echo $option['product_option_id']; ?>">
											<td>
												<?php if ($option['required']) { ?>
													<span>*</span>
												<?php } ?>
												<?php echo $option['name']; ?>:
											</td>
											<td>
												<?php foreach ($option['option_value'] as $option_value) { ?>
													<div class="radio">
														<label for="option-value-<?php echo $option_value['product_option_value_id']; ?>">
															<input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
															<?php echo $option_value['name']; ?>
															
															<?php if ($option_value['price']) { ?>
																(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
															<?php } ?>
														</label>
													</div>
												<?php } ?>
											</td>
										</tr>
									<?php } ?>

									<!-- CHECKBOX -->
									<?php if ($option['type'] == 'checkbox') { ?>
										<tr id="option-<?php echo $option['product_option_id']; ?>">
											<td>
												<?php if ($option['required']) { ?>
													<span>*</span>
												<?php } ?>
												<?php echo $option['name']; ?>:
											</td>
											<td>
												<?php foreach ($option['option_value'] as $option_value) { ?>
													<div class="checkbox">
														<label for="option-value-<?php echo $option_value['product_option_value_id']; ?>">
															<input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
															<?php echo $option_value['name']; ?>
															<?php if ($option_value['price']) { ?>
																(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
															<?php } ?>
														</label>
													</div>
												<?php } ?>
											</td>
										</tr>
									<?php } ?>

									<!-- TEXT -->
									<?php if ($option['type'] == 'text') { ?>
										<tr id="option-<?php echo $option['product_option_id']; ?>">
											<td>
												<?php if ($option['required']) { ?>
													<span>*</span>
												<?php } ?>
												<?php echo $option['name']; ?>:
											</td>
											<td>
												<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" />
											</td>
										</tr>
									<?php } ?>

									<!-- TEXTAREA -->
									<?php if ($option['type'] == 'textarea') { ?>
										<tr id="option-<?php echo $option['product_option_id']; ?>">
											<td>
												<?php if ($option['required']) { ?>
													<span>*</span>
												<?php } ?>
												<?php echo $option['name']; ?>:
											</td>
											<td>
												<textarea name="option[<?php echo $option['product_option_id']; ?>]" cols="40" rows="5"><?php echo $option['option_value']; ?></textarea>
											</td>
										</tr>
									<?php } ?>

									<!-- FILE -->
									<?php if ($option['type'] == 'file') { ?>
										<tr id="option-<?php echo $option['product_option_id']; ?>">
											<td>
												<?php if ($option['required']) { ?>
													<span>*</span>
												<?php } ?>
												<?php echo $option['name']; ?>:
											</td>
											<td>
												<div class="input-type-file btn-darkgrey">
													
													<label class="uploadFIle" id="button-option-<?php echo $option['product_option_id']; ?>"><?php echo $button_upload; ?></label>
													<input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" />
												</div>
											</td>
										</tr>
									<?php } ?>

									<!-- DATE -->
									<?php if ($option['type'] == 'date') { ?>
										<tr id="option-<?php echo $option['product_option_id']; ?>">
											<td>
												<?php if ($option['required']) { ?>
													<span>*</span>
												<?php } ?>
												<?php echo $option['name']; ?>:
											</td>
											<td>
												<div id="datepicker" class="datepicker-wrap">
													<input data-format="dd - MM - yyyy" type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="date" placeholder="10 - 10 - 2013" />
													<span class="add-on hidden-xs">
														<i data-time-icon="glyphicon glyphicon-time" data-date-icon="glyphicon glyphicon-calendar"></i>
													</span>
												</div>
											</td>
										</tr>
									<?php } ?>

									<!-- DATETIME -->
									<?php if ($option['type'] == 'datetime') { ?>
										<tr id="option-<?php echo $option['product_option_id']; ?>">
											<td>
												<?php if ($option['required']) { ?>
													<span>*</span>
												<?php } ?>
												<?php echo $option['name']; ?>:
											</td>
											<td>
												<div id="datetimepicker" class="datepicker-wrap">
													<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="datetime" placeholder="10 - 10 - 2013 14:25" data-format="MM - dd - yyyy HH:mm:ss" />
													<span class="add-on hidden-xs">
														<i data-time-icon="glyphicon glyphicon-time" data-date-icon="glyphicon glyphicon-calendar"></i>
													</span>
												</div>
											</td>
										</tr>
									<?php } ?>

									<!-- TIME -->
									<?php if ($option['type'] == 'time') { ?>
										<tr id="option-<?php echo $option['product_option_id']; ?>">
											<td>
												<?php if ($option['required']) { ?>
													<span>*</span>
												<?php } ?>
												<?php echo $option['name']; ?>:
											</td>
											<td>
												<div id="timepicker" class="datepicker-wrap">
													<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="time" data-format="hh:mm" placeholder="14:25" />
													<span class="add-on hidden-xs">
														<i data-time-icon="glyphicon glyphicon-time" data-date-icon="glyphicon glyphicon-calendar"></i>
													</span>
												</div>
											</td>
										</tr>
									<?php } ?>

								<?php } ?>
							</table>
						</form>
					</div>

					<!-- PRICE BOX -->
					<div class="price-box pull-left w">
						<div class="col-sm-6 col-xs-12 pull-left">
							<span class="pull-left"><?php echo $text_qty; ?></span>
							<div class="input-type-number">
								<input type="text" value="<?php echo $minimum; ?>" min="<?php echo $minimum; ?>" class="number">
								<input type="hidden" name="product_id" size="2" value="<?php echo $product_id; ?>" />
								<a href="#" class="up" data-num="1"></a>
								<a href="#" class="down" data-num="-1"></a>
							</div>
						</div>
						<div class="col-sm-6 col-xs-12 pull-left">
							<a href="#" class="btn btn-basket" id="button-cart">
								<span class="glyphicon glyphicon-shopping-cart"></span>
								<?php echo $button_cart; ?>
							</a>
						</div>
					</div>


					<!-- WISHLIST and LIKE btns -->
					<div class="buttons pull-left w">
						<!-- Wishlist btn -->
						<?php if ($in_wishlist): ?>
							<a href="#" data-product-id="<?php echo $product_id; ?>" class="active fav action-button btn btn-grey col-xs-12 col-sm-4">
								<span class="glyphicon glyphicon-heart"></span>
								<?php echo $button_wishlist; ?>
							</a>
						<?php else: ?>
							<a href="#" data-product-id="<?php echo $product_id; ?>" class="fav action-button btn btn-grey col-xs-12 col-sm-4">
								<span class="glyphicon glyphicon-heart"></span>
								<?php echo $button_wishlist; ?>
							</a>
						<?php endif ?>


						<!-- Compare btn -->
						<?php if ($in_compare): ?>
							<a href="#" data-product-id="<?php echo $product_id; ?>" class="compare active action-button btn btn-grey col-xs-12 col-sm-4">
								<span class="glyphicon glyphicon-stats"></span>
								<?php echo $button_compare; ?>
							</a>
						<?php else: ?>
							<a href="#" data-product-id="<?php echo $product_id; ?>" class="compare action-button btn btn-grey col-xs-12 col-sm-4">
								<span class="glyphicon glyphicon-stats"></span>
							<?php echo $button_compare; ?>
							</a>
						<?php endif ?>
					</div>

				</div>
			</div>

			<!-- PRODUCT TABS -->
			<div class="row">
				<div class="col-md-12">
					<div id="pager"></div>
					<div id="tabs">

						<!-- Description -->
						<div data-title="<?php echo $tab_description; ?>">
							<?php echo $description; ?>
						</div>

						<!-- Attributes -->
						<?php if ($attribute_groups) { ?>
							<div data-title="<?php echo $tab_attribute; ?>">
								<div class="attrs pull-left w">
									<?php foreach ($attribute_groups as $attribute_group) { ?>
										<h5><?php echo $attribute_group['name']; ?></h5>
										<div class="sub">
											<?php foreach ($attribute_group['attribute'] as $attribute) { ?>
												<div class="col-sm-4 col-xs-6 dark"><?php echo $attribute['name']; ?></div>
												<div class="col-sm-8 col-xs-6"><?php echo $attribute['text']; ?></div>
											<?php } ?>
										</div>
									<?php } ?>
								</div>
							</div>
						<?php } ?>
						
						<!-- Reviews -->
						<?php if ($review_status) { ?>
							<div data-title="<?php echo $tab_review; ?>">
								<div id="review"></div>

								<?php if ($review_status) { ?>
									<div class="options">
										<form class="review-form">
											<h3><?php echo $text_write; ?></h3>

											<table class="w">
												<tr>
													<td><span>*</span> <?php echo $entry_name; ?></td>
													<td>
														<input type="text" name="name" value="" />
													</td>
												</tr>
												<tr class="review-text">
													<td><span>*</span> <?php echo $entry_review; ?></td>
													<td>
														<textarea name="text"></textarea>
														<div><?php echo $text_note; ?></div>
													</td>
												</tr>
												<tr class="review-rating">
													<td><span>*</span> <?php echo $entry_rating; ?></td>
													<td>
														<span class="radio-title"><?php echo $entry_bad; ?></span>
														<div class="radio pul-left">
															<label for="rating-1">
																<input name="rating" id="rating-1" type="radio" value="1">
															</label>
														</div>
														<div class="radio pul-left">
															<label for="rating-2">
																<input name="rating" id="rating-2" type="radio" value="2">
															</label>
														</div>
														<div class="radio pul-left">
															<label for="rating-3">
																<input name="rating" id="rating-3" type="radio" value="3">
															</label>
														</div>
														<div class="radio pul-left">
															<label for="rating-4">
																<input name="rating" id="rating-4" type="radio" value="4">
															</label>
														</div>
														<div class="radio pul-left">
															<label for="rating-5">
																<input name="rating" id="rating-5" type="radio" value="5">
															</label>
														</div>
														<span class="radio-title good"><?php echo $entry_good; ?></span>
													</td>
												</tr>
												<tr>
													<td>
														<span>*</span> <?php echo $entry_captcha; ?>
													</td>
													<td>
														<div class="col-lg-4 col-md-12"><img src="index.php?route=product/product/captcha" alt="" id="captcha" /></div>
														
														<div class="col-lg-8 col-md-12"><input type="text" name="captcha" value="" /></div>
													</td>
												</tr>
												<tr>
													<td>&nbsp;</td>
													<td>
														<a href="#" id="button-review" class="btn btn-darkgrey"><?php echo $button_continue; ?></a>
													</td>
												</tr>
											</table>
										</form>
									</div>
								<?php } ?>
							</div>
						<?php } ?>
					</div>
				</div>
			</div>


			<!-- Related products -->
			<?php if ($products) { ?>
				<h3 class="line">
					<span>RELATED PRODUCTS</span>
					<i></i>
				</h3>

				<div class="row catalog">
					<?php foreach ($products as $product) { ?>
						<!-- Check if product is already in wishlist -->
						<?php 
							$in_compare = in_array($product['product_id'], $this->session->data['compare']);
							$in_wishlist = in_array($product['product_id'], $this->session->data['wishlist']);
						?>

						<div class="product-preview-block-<?php echo $product['product_id']; ?> col-lg-4 col-md-6 col-sm-6">
							<div class="img-holder">
								<img src="<?php echo $product['thumb']; ?>" title="" alt="">
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
														<input type="text" value="<?php echo $product['minimum']; ?>" min="<?php echo $product['minimum']; ?>" class="number">
														<input type="hidden" name="product_id" size="2" value="<?php echo $product['product_id']; ?>" />
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
												$in_compare = in_array($product['product_id'], $this->session->data['compare']);
												$in_wishlist = in_array($product['product_id'], $this->session->data['wishlist']);
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

			<!-- Tags -->
			<?php if ($tags) { ?>
				<div class="tags"><b><?php echo $text_tags; ?></b>
					<?php for ($i = 0; $i < count($tags); $i++) { ?>
					<?php if ($i < (count($tags) - 1)) { ?>
					<a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
					<?php } else { ?>
					<a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
					<?php } ?>
					<?php } ?>
				</div>
			<?php } ?>

		</div>
	</div>
</div>


	
	
	<?php echo $content_bottom; ?></div>


<script type="text/javascript"><!--

$('select[name="profile_id"], input[name="quantity"]').change(function(){
	$('#profile-description').slideUp();

    $.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name="product_id"], input[name="quantity"], select[name="profile_id"]'),
		dataType: 'json',
        beforeSend: function() {
            $('#profile-description').html('');
        },
		success: function(json) {
			$('.success, .warning, .attention, information, .error').remove();
            
			if (json['success']) {
                $('#profile-description').html(json['success']).slideDown();
			}	
		}
	});
});
    
$('#button-cart').on('click', function(e) {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('.product-info input[type=\'text\'], .product-info input[type=\'hidden\'], .product-info input[type=\'radio\']:checked, .product-info input[type=\'checkbox\']:checked, .product-info select, .product-info textarea'),
		dataType: 'json',
		success: function(json) {
			$('.product-info .options tr').animate({
				'background-color': '#fff'
			});
			
			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						$('#option-' + i).animate({
							'background-color': '#FFF5F5'
						});
					}
				}
                
                if (json['error']['profile']) {
                    $('select[name="profile_id"]').closest('tr').animate({
						'background-color': '#FFF5F5'
					});
                }

                $('html, body').animate({
					scrollTop: $("#product-options").offset().top
				});
			} 
			
			if (json['success']) {
				$.fancybox.open(json['success']);
			}	
		}
	});

	e.preventDefault();
});
//--></script>
<?php if ($options) { ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/ajaxupload.js"></script>
<?php foreach ($options as $option) { ?>
<?php if ($option['type'] == 'file') { ?>
<script type="text/javascript"><!--
new AjaxUpload('#button-option-<?php echo $option['product_option_id']; ?>', {
	action: 'index.php?route=product/product/upload',
	name: 'file',
	autoSubmit: true,
	responseType: 'json',
	onSubmit: function(file, extension) {
		$('#button-option-<?php echo $option['product_option_id']; ?>').after('<img src="catalog/view/theme/default/image/loading.gif" class="loading" style="padding-left: 5px;" />');
		$('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', true);
	},
	onComplete: function(file, json) {
		$('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', false);
		
		$('.error').remove();
		
		if (json['success']) {
			alert(json['success']);
			
			$('input[name=\'option[<?php echo $option['product_option_id']; ?>]\']').attr('value', json['file']);
		}
		
		if (json['error']) {
			$('#option-<?php echo $option['product_option_id']; ?>').after('<span class="error">' + json['error'] + '</span>');
		}
		
		$('.loading').remove();	
	}
});
//--></script>
<?php } ?>
<?php } ?>
<?php } ?>
<script type="text/javascript"><!--
$('#review .pagination a').on('click', function() {
	$('#review').fadeOut('slow');
		
	$('#review').load(this.href);
	
	$('#review').fadeIn('slow');
	
	return false;
});			

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').on('click', function(e) {
	// Update tab container size
	var _updateTabSizes = function () {
		var tabContainer = $('#tabs').parent();

		tabContainer.animate({
			height: tabContainer.height() + 70
		});
	};

	// Remove all errors
	$('.review-form .alert').slideUp(function () {
		$(this).remove();
	});

	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#button-review').attr('disabled', true);
			$('#review-title').after('<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
		},
		complete: function() {
			$('#button-review').attr('disabled', false);
			$('.attention').remove();
		},
		success: function(data) {
			if (data['error']) {
				$('.review-form').animate({
					'background-color': '#FFF5F5'
				});

				// Update tab container size
				_updateTabSizes();

				// Append errors
				$('.review-form h3').before('<div class="alert alert-block alert-danger">' + data['error'] + '</div>');
				$('.review-form .alert').hide().slideDown();
			}
			
			if (data['success']) {
				$('.review-form').animate({
					'background-color': '#F7F7F7'
				});

				// Update tab container size
				_updateTabSizes();

				$('.review-form h3').before('<div class="alert alert-block alert-success">' + data['success'] + '</div>');
				$('.review-form .alert').hide().slideDown();
				
				var timer = setTimeout(function () {
					$('.review-form .alert').slideUp(function () {
						$(this).remove();
					});
				}, 2000);

				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').attr('checked', '');
				$('input[name=\'captcha\']').val('');
			}
		}
	});

	e.preventDefault();
});
//--></script>

<?php echo $footer; ?>