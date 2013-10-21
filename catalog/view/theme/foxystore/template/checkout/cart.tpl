<?php echo $header; ?>

<!-- Content -->
<div class="container">
	<div class="row">
		<div class="col-lg-12">

			<!-- Breadcrumbs -->
			<div class="breadcrumb hidden-lg">
				<?php foreach ($breadcrumbs as $key => $breadcrumb) { ?>
					<?php if ($key == count($breadcrumbs) - 1): ?>
						<li><?php echo $breadcrumb['text']; ?></li>
					<?php else: ?>
						<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
					<?php endif ?>
				<?php } ?>
			</div>

			<h1>
				<?php echo $heading_title; ?>
				<?php if ($weight) { ?>
				&nbsp;(<?php echo $weight; ?>)
				<?php } ?>
			</h1>

			<?php if ($attention) { ?>
				<div class="alert alert-warning"><?php echo $attention; ?></div>
			<?php } ?>
			<?php if ($success) { ?>
				<div class="alert alert-success"><?php echo $success; ?></div>
			<?php } ?>
			<?php if ($error_warning) { ?>
				<div class="alert alert-danger"><?php echo $error_warning; ?></div>
			<?php } ?>

			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
				<table class="cart">
					<tr>
						<th><?php echo $column_name; ?></th>
						<th class="hidden-xs"><?php echo $column_model; ?></th>
						<th><?php echo $column_quantity; ?></th>
						<th class="hidden-sm hidden-xs"><?php echo $column_price; ?></th>
						<th><?php echo $column_total; ?></th>
					</tr>
					<?php foreach ($products as $product) { ?>
						<?php if($product['recurring']): ?>
							<tr class="recurring">
								<td colspan="6" style="border:none;"><image src="catalog/view/theme/default/image/reorder.png" alt="" title="" style="float:left;" /><span style="float:left;line-height:18px; margin-left:10px;"> 
										<strong><?php echo $text_recurring_item ?></strong>
										<?php echo $product['profile_description'] ?>
								</td>
							</tr>
						<?php endif; ?>
						<tr>
							<td class="info">
								<?php if ($product['thumb']) { ?>
									<img src="<?php echo $product['thumb']; ?>" class="hidden-xs" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" />
								<?php } ?>
								<a href="<?php echo $product['href']; ?>" class="title hh">
									<?php echo $product['name']; ?>
									<?php if (!$product['stock']) { ?>
										<span class="stock error">***</span>
									<?php } ?>
								</a>
								<?php if ($product['reward']) { ?>
									<span class="reward hidden-xs"><?php echo $product['reward']; ?></span>
								<?php } ?>
							</td>
							<td class="model hidden-xs"><?php echo $product['model']; ?></td>
							<td class="count">
								<div class="input-type-number">
									<input type="text" name="quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" min="1" class="number">
									<a href="#" class="up hidden-xs" data-num="1"></a>
									<a href="#" class="down hidden-xs" data-num="-1"></a>
								</div>
								<a href="#" class="repeat tooltiped" onclick="$(this).closest('form').submit(); return false;" title="<?php echo $button_update; ?>" data-toggle="tooltip" data-placement="left"><span class="glyphicon glyphicon-repeat"></span></a>
								<a href="<?php echo $product['remove']; ?>" title="<?php echo $button_remove; ?>" data-toggle="tooltip" data-placement="left" class="close-holder tooltiped"><span class="close" data-product-key="<?php echo $product['key'] ?>">&times;</span></a>
							</td>
							<td class="price hidden-sm hidden-xs">
								<?php echo $product['price'] ?>
							</td>
							<td class="price">
								<?php echo $product['total'] ?>
							</td>
						</tr>
						<?php foreach ($vouchers as $vouchers) { ?>
							<tr>
								<td class="image"></td>
								<td class="name"><?php echo $vouchers['description']; ?></td>
								<td class="model"></td>
								<td class="quantity"><input type="text" name="" value="1" size="1" disabled="disabled" />
								&nbsp;<a href="<?php echo $vouchers['remove']; ?>"><img src="catalog/view/theme/default/image/remove.png" alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" /></a></td>
								<td class="price"><?php echo $vouchers['amount']; ?></td>
								<td class="total"><?php echo $vouchers['amount']; ?></td>
							</tr>
						<?php } ?>
					<?php } ?>
				</table>
			</form>

			<?php if ($coupon_status || $voucher_status || $reward_status || $shipping_status) { ?>
				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
				<div class="cart-form">
					<h2><?php echo $text_next; ?></h2>
					<p><?php echo $text_next_choice; ?></p>
					<table class="radio">
						<?php if ($coupon_status) { ?>
						<tr class="highlight">
							<td><?php if ($next == 'coupon') { ?>
								<label for="use_coupon" class="checked">
									<input type="radio" name="next" value="coupon" id="use_coupon" checked="checked" />
									<?php echo $text_use_coupon; ?>
								</label>
								<?php } else { ?>
								<label for="use_coupon">
									<input type="radio" name="next" value="coupon" id="use_coupon" />
									<?php echo $text_use_coupon; ?>
								</label>
								<?php } ?></td>
							<td></td>
						</tr>
						<?php } ?>
						<?php if ($voucher_status) { ?>
						<tr class="highlight">
							<td><?php if ($next == 'voucher') { ?>
								<label for="use_voucher" class="checked">
									<input type="radio" name="next" value="voucher" id="use_voucher" checked="checked" />
									<?php echo $text_use_voucher; ?>
								</label>
								<?php } else { ?>
								<label for="use_voucher">
									<input type="radio" name="next" value="voucher" id="use_voucher" />
									<?php echo $text_use_voucher; ?>
								</label>
								<?php } ?></td>
							<td></td>
						</tr>
						<?php } ?>
						<?php if ($reward_status) { ?>
						<tr class="highlight">
							<td><?php if ($next == 'reward') { ?>
								<label for="use_reward" class="checked">
									<input type="radio" name="next" value="reward" id="use_reward" checked="checked" />
									<?php echo $text_use_reward; ?>
								</label>
								<?php } else { ?>
								<label for="use_reward" class="checked">
									<input type="radio" name="next" value="reward" id="use_reward" />
									<?php echo $text_use_reward; ?>
								</label>
								<?php } ?></td>
							<td></td>
						</tr>
						<?php } ?>
						<?php if ($shipping_status) { ?>
						<tr class="highlight">
							<td><?php if ($next == 'shipping') { ?>
								<label for="shipping_estimate" class="checked">
									<input type="radio" name="next" value="shipping" id="shipping_estimate" checked="checked" />
									<?php echo $text_shipping_estimate; ?>
								</label>
								<?php } else { ?>
								<label for="shipping_estimate">
									<input type="radio" name="next" value="shipping" id="shipping_estimate" />
									<?php echo $text_shipping_estimate; ?>
								</label>
								<?php } ?></td>
							<td></td>
						</tr>
						<?php } ?>
					</table>
				
					<div class="cart-module">
						<div id="coupon" class="cart-coupon-module" style="display: <?php echo ($next == 'coupon' ? 'block' : 'none'); ?>;">
							<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
								<div class="title"><?php echo $entry_coupon; ?></div>
								<input type="text" name="coupon" value="<?php echo $coupon; ?>" />
								<input type="hidden" name="next" value="coupon" />
								&nbsp;
								<input type="submit" value="<?php echo $button_coupon; ?>" class="btn btn-darkgrey" />
							</form>
						</div>
						<div id="voucher" class="cart-coupon-module" style="display: <?php echo ($next == 'voucher' ? 'block' : 'none'); ?>;">
							<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
								<div class="title"><?php echo $entry_voucher; ?></div>
								<input type="text" name="voucher" value="<?php echo $voucher; ?>" />
								<input type="hidden" name="next" value="voucher" />
								&nbsp;
								<input type="submit" value="<?php echo $button_voucher; ?>" class="btn btn-darkgrey" />
							</form>
						</div>
						<div id="reward" class="cart-coupon-module" style="display: <?php echo ($next == 'reward' ? 'block' : 'none'); ?>;">
							<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
								<div class="title"><?php echo $entry_reward; ?></div>
								<input type="text" name="reward" value="<?php echo $reward; ?>" />
								<input type="hidden" name="next" value="reward" />
								&nbsp;
								<input type="submit" value="<?php echo $button_reward; ?>" class="btn btn-darkgrey" />
							</form>
						</div>
						<div id="shipping" class="cart-coupon-module" style="display: <?php echo ($next == 'shipping' ? 'block' : 'none'); ?>;">
							<p><?php echo $text_shipping_detail; ?></p>
							<table>
								<tr>
									<td><span class="required">*</span> <?php echo $entry_country; ?></td>
									<td><select name="country_id">
											<option value=""><?php echo $text_select; ?></option>
											<?php foreach ($countries as $country) { ?>
											<?php if ($country['country_id'] == $country_id) { ?>
											<option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
											<?php } else { ?>
											<option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
											<?php } ?>
											<?php } ?>
										</select></td>
								</tr>
								<tr>
									<td><span class="required">*</span> <?php echo $entry_zone; ?></td>
									<td><select name="zone_id">
										</select></td>
								</tr>
								<tr>
									<td><span id="postcode-required" class="required">*</span> <?php echo $entry_postcode; ?></td>
									<td><input type="text" name="postcode" value="<?php echo $postcode; ?>" /></td>
								</tr>
							</table>
							<input type="button" value="<?php echo $button_quote; ?>" id="button-quote" class="btn btn-darkgrey" />
						</div>
					</div>
				</div>
				</form>
			<?php } ?>

			<div class="cart-totals pull-right">
				<?php foreach ($totals as $total) { ?>
					<?php if ($total['code'] == 'total'): ?>
						<h6 class="total"><?php echo $total['title']; ?>:<span><?php echo $total['text']; ?></span></h6>
					<?php else: ?>
						<h6><?php echo $total['title']; ?>:<span><?php echo $total['text']; ?></span></h6>
					<?php endif ?>
				<?php } ?>
			</div>

			<div class="cart-actions pull-left w">
				<a href="<?php echo $checkout; ?>" class="btn btn-basket pull-left"><?php echo $button_checkout ?></a>
				<a href="<?php echo $checkout; ?>" class="btn btn-basket pull-right"><?php echo $button_shopping ?></a>
			</div>


		</div>
	</div>
</div>

<script type="text/javascript"><!--
$(document).ready(function () {
	$('input[name=\'next\']').bind('change', function() {
		$('.cart-module > div').hide();
		
		$('#' + this.value).show();
	});
});
//--></script>
<?php if ($shipping_status) { ?>
<script type="text/javascript"><!--
$(document).ready(function () {
	$('#button-quote').on('click', function() {
		$.ajax({
			url: 'index.php?route=checkout/cart/quote',
			type: 'post',
			data: 'country_id=' + $('select[name=\'country_id\']').val() + '&zone_id=' + $('select[name=\'zone_id\']').val() + '&postcode=' + encodeURIComponent($('input[name=\'postcode\']').val()),
			dataType: 'json',		
			beforeSend: function() {
				$('#button-quote').attr('disabled', true);
				$('#button-quote').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
			},
			complete: function() {
				$('#button-quote').attr('disabled', false);
				$('.wait').remove();
			},		
			success: function(json) {
				$('.success, .warning, .attention, .error').remove();			
							
				if (json['error']) {
					if (json['error']['warning']) {
						$('#notification').html('<div class="alert alert-warning" style="display: none;">' + json['error']['warning'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
						
						$('.warning').fadeIn('slow');
						
						$('html, body').animate({ scrollTop: 0 }, 'slow'); 
					}	
								
					if (json['error']['country']) {
						$('select[name=\'country_id\']').after('<span class="error">' + json['error']['country'] + '</span>');
					}	
					
					if (json['error']['zone']) {
						$('select[name=\'zone_id\']').after('<span class="error">' + json['error']['zone'] + '</span>');
					}
					
					if (json['error']['postcode']) {
						$('input[name=\'postcode\']').after('<span class="error">' + json['error']['postcode'] + '</span>');
					}					
				}
				
				if (json['shipping_method']) {
					html  = '<h2><?php echo $text_shipping_method; ?></h2>';
					html += '<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">';
					html += '  <table class="checkout-shipping-details">';
					
					for (i in json['shipping_method']) {
						html += '<tr>';
						html += '  <td colspan="3"><b>' + json['shipping_method'][i]['title'] + '</b></td>';
						html += '</tr>';
					
						if (!json['shipping_method'][i]['error']) {
							for (j in json['shipping_method'][i]['quote']) {
								html += '<tr class="highlight">';

								if (json['shipping_method'][i]['quote'][j]['code'] == '<?php echo $shipping_method; ?>') {
									html += '<td><input type="radio" name="shipping_method" value="' + json['shipping_method'][i]['quote'][j]['code'] + '" id="' + json['shipping_method'][i]['quote'][j]['code'] + '" checked="checked" /></td>';
								} else {
									html += '<td><input type="radio" name="shipping_method" value="' + json['shipping_method'][i]['quote'][j]['code'] + '" id="' + json['shipping_method'][i]['quote'][j]['code'] + '" /></td>';
								}
									
								html += '<td class="radio"><label onclick=$(this).closest("tr").find("label").removeClass("checked").end().end().toggleClass("checked"); for="' + json['shipping_method'][i]['quote'][j]['code'] + '">' + json['shipping_method'][i]['quote'][j]['title'] + ' ( ' + json['shipping_method'][i]['quote'][j]['text'] + ' )</label></td>';
								html += '</tr>';
							}
						} else {
							html += '<tr>';
							html += '  <td colspan="3"><div class="error">' + json['shipping_method'][i]['error'] + '</div></td>';
							html += '</tr>';						
						}
					}
					
					html += '  </table>';
					html += '  <br />';
					html += '  <input type="hidden" name="next" value="shipping" />';
					
					<?php if ($shipping_method) { ?>
					html += '  <input type="submit" value="<?php echo $button_shipping; ?>" id="button-shipping" class="button" />';	
					<?php } else { ?>
					html += '  <input type="submit" value="<?php echo $button_shipping; ?>" id="button-shipping" class="button" disabled="disabled" />';	
					<?php } ?>
								
					html += '</form>';
					
					$.fancybox.open({
						content: html
					});
					
					$('input[name=\'shipping_method\']').bind('change', function() {
						$('#button-shipping').attr('disabled', false);
					});
				}
			}
		});
	});
});
//--></script> 
<script type="text/javascript"><!--
$(document).ready(function () {
	$('select[name=\'country_id\']').bind('change', function() {
		$.ajax({
			url: 'index.php?route=checkout/cart/country&country_id=' + this.value,
			dataType: 'json',
			beforeSend: function() {
				$('select[name=\'country_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
			},
			complete: function() {
				$('.wait').remove();
			},			
			success: function(json) {
				if (json['postcode_required'] == '1') {
					$('#postcode-required').show();
				} else {
					$('#postcode-required').hide();
				}
				
				html = '<option value=""><?php echo $text_select; ?></option>';
				
				if (json['zone'] != '') {
					for (i = 0; i < json['zone'].length; i++) {
								html += '<option value="' + json['zone'][i]['zone_id'] + '"';
							
						if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
									html += ' selected="selected"';
							}
		
							html += '>' + json['zone'][i]['name'] + '</option>';
					}
				} else {
					html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
				}
				
				$('select[name=\'zone_id\']').html(html).selectpicker('refresh');
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	});

	$('select[name=\'country_id\']').trigger('change');
});
//--></script>
<?php } ?>
<?php echo $footer; ?>
