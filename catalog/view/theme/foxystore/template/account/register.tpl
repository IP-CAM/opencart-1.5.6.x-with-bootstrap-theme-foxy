<?php echo $header; ?><?php echo $content_top; ?>
<div class="container">
	<div class="row">
		<?php if (trim($column_left)): ?>
			<div class="col-lg-3 col-md-4 col-sm-4 hidden-xs">
				<?php echo $column_left; ?>
			</div>
			<div class="col-lg-9 col-md-8 col-sm-8 the-content options">
		<?php elseif (trim($column_right)): ?>
			<div class="col-lg-9 col-md-8 col-sm-8 the-content options">
		<?php else: ?>
			<div class="col-lg-12 the-content options">
		<?php endif ?>

			<div class="breadcrumb">
				<?php foreach ($breadcrumbs as $key => $breadcrumb) { ?>
					<?php if ($key == count($breadcrumbs) - 1): ?>
						<li><?php echo $breadcrumb['text']; ?></li>
					<?php else: ?>
						<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
					<?php endif ?>
				<?php } ?>
			</div>

			<h1><?php echo $heading_title; ?></h1>
			<p><?php echo $text_account_already; ?></p>
			<?php if ($error_warning) { ?>
			<div class="alert alert-danger"><?php echo $error_warning; ?></div>
			<?php } ?>
			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
				<fieldset>
					<legend><?php echo $text_your_details; ?></legend>
					<div class="form-group required">
						<label class="col-sm-2 control-label" for="input-firstname"><?php echo $entry_firstname; ?></label>
						<div class="col-sm-10">
							<?php if ($error_firstname) { ?>
								<input type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="<?php echo $entry_firstname; ?>" id="input-firstname" class="form-control error" />
								<div class="text-danger"><?php echo $error_firstname; ?></div>
							<?php } else { ?>
								<input type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="<?php echo $entry_firstname; ?>" id="input-firstname" class="form-control" />
							<?php } ?>
						</div>
					</div>
					<div class="form-group required">
						<label class="col-sm-2 control-label" for="input-lastname"><?php echo $entry_lastname; ?></label>
						<div class="col-sm-10">
							<?php if ($error_lastname) { ?>
								<input type="text" name="lastname" value="<?php echo $lastname; ?>" placeholder="<?php echo $entry_lastname; ?>" id="input-lastname" class="form-control error" />
								<div class="text-danger"><?php echo $error_lastname; ?></div>
							<?php } else { ?>
								<input type="text" name="lastname" value="<?php echo $lastname; ?>" placeholder="<?php echo $entry_lastname; ?>" id="input-lastname" class="form-control" />
							<?php } ?>
						</div>
					</div>
					<div class="form-group required">
						<label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
						<div class="col-sm-10">
							<?php if ($error_email) { ?>
								<input type="email" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control error" />
								<div class="text-danger"><?php echo $error_email; ?></div>
							<?php } else { ?>
								<input type="email" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
							<?php } ?>
						</div>
					</div>
					<div class="form-group required">
						<label class="col-sm-2 control-label" for="input-telephone"><?php echo $entry_telephone; ?></label>
						<div class="col-sm-10">
							<?php if ($error_telephone) { ?>
								<input type="tel" name="telephone" value="<?php echo $telephone; ?>" placeholder="<?php echo $entry_telephone; ?>" id="input-telephone" class="form-control error" />
								<div class="text-danger"><?php echo $error_telephone; ?></div>
							<?php } else { ?>
								<input type="tel" name="telephone" value="<?php echo $telephone; ?>" placeholder="<?php echo $entry_telephone; ?>" id="input-telephone" class="form-control" />
							<?php } ?>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-fax"><?php echo $entry_fax; ?></label>
						<div class="col-sm-10">
							<input type="text" name="fax" value="<?php echo $fax; ?>" placeholder="<?php echo $entry_fax; ?>" id="input-fax" class="form-control" />
						</div>
					</div>
				</fieldset>
				<fieldset>
					<legend><?php echo $text_your_address; ?></legend>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-company"><?php echo $entry_company; ?></label>
						<div class="col-sm-10">
							<input type="text" name="company" value="<?php echo $company; ?>" placeholder="<?php echo $entry_company; ?>" id="input-company" class="form-control" />
						</div>
					</div>
					<div class="form-group" style="display: <?php echo (count($customer_groups) > 1 ? 'display' : 'none'); ?>;">
						<label class="col-sm-2 control-label"><?php echo $entry_customer_group; ?></label>
						<div class="col-sm-10">
							<?php foreach ($customer_groups as $customer_group) { ?>
							<?php if ($customer_group['customer_group_id'] == $customer_group_id) { ?>
							<div class="radio">
								<label id="customer_group_id_radio">
									<input type="radio" name="customer_group_id_radio" value="<?php echo $customer_group['customer_group_id']; ?>" checked="checked" />
									<?php echo $customer_group['name']; ?></label>
							</div>
							<?php } else { ?>
								<div class="radio">
									<label id="customer_group_id_radio">
										<input type="radio" name="customer_group_id_radio" value="<?php echo $customer_group['customer_group_id']; ?>" />
										<?php echo $customer_group['name']; ?></label>
								</div>
							<?php } ?>
							<?php } ?>
						</div>
					</div>
					<div class="form-group required">
						<label class="col-sm-2 control-label" for="input-address-1"><?php echo $entry_address_1; ?></label>
						<div class="col-sm-10">
							<?php if ($error_address_1) { ?>
								<input type="text" name="address_1" value="<?php echo $address_1; ?>" placeholder="<?php echo $entry_address_1; ?>" id="input-address-1" class="form-control error" />
								<div class="text-danger"><?php echo $error_address_1; ?></div>
							<?php } else { ?>
								<input type="text" name="address_1" value="<?php echo $address_1; ?>" placeholder="<?php echo $entry_address_1; ?>" id="input-address-1" class="form-control" />
							<?php } ?>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-address-2" for="input-address-2">
						<?php echo $entry_address_2; ?>
						</label>
						<div class="col-sm-10">
							<input type="text" name="address_2" value="<?php echo $address_2; ?>" placeholder="<?php echo $entry_address_2; ?>" id="input-address-2" class="form-control" />
						</div>
					</div>
					<div class="form-group required">
						<label class="col-sm-2 control-label" for="input-city"><?php echo $entry_city; ?></label>
						<div class="col-sm-10">
							<?php if ($error_city) { ?>
								<input type="text" name="city" value="<?php echo $city; ?>" placeholder="<?php echo $entry_city; ?>" id="input-city" class="form-control error" />
								<div class="text-danger"><?php echo $error_city; ?></div>
							<?php } else { ?>
								<input type="text" name="city" value="<?php echo $city; ?>" placeholder="<?php echo $entry_city; ?>" id="input-city" class="form-control" />
							<?php } ?>
						</div>
					</div>
					<div class="form-group required">
						<label class="col-sm-2 control-label" for="input-postcode"><?php echo $entry_postcode; ?></label>
						<div class="col-sm-10">
							<?php if ($error_postcode) { ?>
								<input type="text" name="postcode" value="<?php echo $postcode; ?>" placeholder="<?php echo $entry_postcode; ?>" id="input-postcode" class="form-control error" />
								<div class="text-danger"><?php echo $error_postcode; ?></div>
							<?php } else { ?>
								<input type="text" name="postcode" value="<?php echo $postcode; ?>" placeholder="<?php echo $entry_postcode; ?>" id="input-postcode" class="form-control" />
							<?php } ?>
						</div>
					</div>
					<div class="form-group required">
						<label class="col-sm-2 control-label" for="input-country"><?php echo $entry_country; ?></label>
						<div class="col-sm-10">
							<?php if ($error_country) { ?>
								<select name="country_id" id="input-country" class="form-control error">
									<option value=""><?php echo $text_select; ?></option>
									<?php foreach ($countries as $country) { ?>
									<?php if ($country['country_id'] == $country_id) { ?>
									<option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
									<?php } else { ?>
									<option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
									<?php } ?>
									<?php } ?>
								</select>
								<div class="text-danger"><?php echo $error_country; ?></div>
							<?php } else { ?>
								<select name="country_id" id="input-country" class="form-control">
									<option value=""><?php echo $text_select; ?></option>
									<?php foreach ($countries as $country) { ?>
									<?php if ($country['country_id'] == $country_id) { ?>
									<option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
									<?php } else { ?>
									<option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
									<?php } ?>
									<?php } ?>
								</select>
							<?php } ?>
						</div>
					</div>
					<div class="form-group required">
						<label class="col-sm-2 control-label" for="input-zone"><?php echo $entry_zone; ?></label>
						<div class="col-sm-10">
							<?php if ($error_zone) { ?>
								<select name="zone_id" id="input-zone" class="form-control error"></select>
								<div class="text-danger"><?php echo $error_zone; ?></div>
							<?php } else { ?>
								<select name="zone_id" id="input-zone" class="form-control"></select>
							<?php } ?>
						</div>
					</div>
				</fieldset>
				<fieldset>
					<legend><?php echo $text_your_password; ?></legend>
					<div class="form-group required">
						<label class="col-sm-2 control-label" for="input-password"><?php echo $entry_password; ?></label>
						<div class="col-sm-10">
							<?php if ($error_password) { ?>
								<input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control error" />
								<div class="text-danger"><?php echo $error_password; ?></div>
							<?php } else { ?>
								<input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
							<?php } ?>
						</div>
					</div>
					<div class="form-group required">
						<label class="col-sm-2 control-label" for="input-confirm"><?php echo $entry_confirm; ?></label>
						<div class="col-sm-10">
							<?php if ($error_confirm) { ?>
								<input type="password" name="confirm" value="<?php echo $confirm; ?>" placeholder="<?php echo $entry_confirm; ?>" id="input-confirm" class="form-control error" />
								<div class="text-danger"><?php echo $error_confirm; ?></div>
							<?php } else { ?>
								<input type="password" name="confirm" value="<?php echo $confirm; ?>" placeholder="<?php echo $entry_confirm; ?>" id="input-confirm" class="form-control" />
							<?php } ?>
						</div>
					</div>
				</fieldset>
				<fieldset>
					<legend><?php echo $text_newsletter; ?></legend>
					<div class="form-group">
						<label class="col-sm-2 control-label"><?php echo $entry_newsletter; ?></label>
						<div class="col-sm-10">
							<?php if ($newsletter) { ?>
							<div class="radio radio-inline">
								<label for="newsletter-1" class="checked">
									<input type="radio" id="newsletter-1" name="newsletter" value="1" checked="checked" />
									<?php echo $text_yes; ?>
								</label>
							</div>
							<div class="radio radio-inline">
								<label for="newsletter-2">
									<input type="radio" id="newsletter-2" name="newsletter" value="0" />
									<?php echo $text_no; ?>
								</label>
							</div>
							<?php } else { ?>
							<div class="radio radio-inline">
								<label for="newsletter-1" class="checked">
									<input type="radio" id="newsletter-1" name="newsletter" value="1" checked="checked" />
									<?php echo $text_yes; ?>
								</label>
							</div>
							<div class="radio radio-inline">
								<label for="newsletter-2">
									<input type="radio" id="newsletter-2" name="newsletter" value="0" />
									<?php echo $text_no; ?>
								</label>
							</div>
							<?php } ?>
						</div>
					</div>
				</fieldset>
				<?php if ($text_agree) { ?>
				<div class="col-sm-10 col-sm-offset-2 buttons">
					<div class="pull-left">
						<?php if ($agree) { ?>
							<div class="checkbox pull-left">
								<label for="agree" class="checked">
									<input type="checkbox" id="agree" name="agree" value="1" checked="checked" />
									<?php echo $text_agree; ?>
								</label>
								<input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-basket pull-left" />
							</div>
						<?php } else { ?>
							<div class="checkbox pull-left">
								<label for="agree">
									<input type="checkbox" id="agree" name="agree" value="1" />
									<span><?php echo $text_agree; ?></span>
								</label>
								<input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-basket pull-left" />
							</div>
						<?php } ?>
					</div>
				</div>
				<?php } else { ?>
				<div class="col-sm-10 col-sm-offset-2">
					<div class="pull-left">
						<input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-basket" />
					</div>
				</div>
				<?php } ?>
			</form>
			</div>
			<?php if (trim($column_right) AND ! trim($column_left)): ?>
			<div class="col-lg-3 col-md-4 col-sm-4 hidden-xs">
				<?php echo $column_right; ?>
			</div>
		<?php endif ?>
		</div>
</div>
<script type="text/javascript"><!--
$('input[name=\'customer_group_id\']:checked').change(function() {
	var customer_group = [];
	

});

$('input[name=\'customer_group_id\']:checked').trigger('change');
//--></script> 
<script type="text/javascript"><!--
$('select[name=\'country_id\']').bind('change', function() {
	$.ajax({
		url: 'index.php?route=account/register/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('select[name=\'country_id\']').after(' <i class="icon-spinner icon-spin"></i>');
		},
		complete: function() {
			$('.icon-spinner').remove();
		},      
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('#input-postcode').parent().parent().addClass('required');
			} else {
				$('#input-postcode').parent().parent().removeClass('required');
			}
			
			html = '<option value=""><?php echo $text_select; ?></option>';
			
			if (json['zone']) {
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
//--></script>
<?php echo $content_bottom; ?><?php echo $footer; ?>