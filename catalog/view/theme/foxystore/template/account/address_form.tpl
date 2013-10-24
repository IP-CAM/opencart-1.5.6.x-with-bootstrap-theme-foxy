<?php echo $header; ?>

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
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
        <div class="content">
          <fieldset>
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-firstname"><?php echo $entry_firstname; ?></label>
              <div class="col-sm-10">
                <input type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="<?php echo $entry_firstname; ?>" id="input-firstname" class="form-control" />
                <?php if ($error_firstname) { ?>
                <div class="text-danger"><?php echo $error_firstname; ?></div>
                <?php } ?>
              </div>
            </div>
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-lastname"><?php echo $entry_lastname; ?></label>
              <div class="col-sm-10">
                <input type="text" name="lastname" value="<?php echo $lastname; ?>" placeholder="<?php echo $entry_lastname; ?>" id="input-lastname" class="form-control" />
                <?php if ($error_lastname) { ?>
                <div class="text-danger"><?php echo $error_lastname; ?></div>
                <?php } ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-company"><?php echo $entry_company; ?></label>
              <div class="col-sm-10">
                <input type="text" name="company" value="<?php echo $company; ?>" placeholder="<?php echo $entry_company; ?>" id="input-company" class="form-control" />
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-address-1"><?php echo $entry_address_1; ?></label>
              <div class="col-sm-10">
                <input type="text" name="address_1" value="<?php echo $address_1; ?>" placeholder="<?php echo $entry_address_1; ?>" id="input-address-1" class="form-control" />
                <?php if ($error_address_1) { ?>
                <div class="text-danger"><?php echo $error_address_1; ?></div>
                <?php } ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-address-2"><?php echo $entry_address_2; ?></label>
              <div class="col-sm-10">
                <input type="text" name="address_2" value="<?php echo $address_2; ?>" placeholder="<?php echo $entry_address_2; ?>" id="input-address-2" class="form-control" />
              </div>
            </div>
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-city"><?php echo $entry_city; ?> </label>
              <div class="col-sm-10">
                <input type="text" name="city" value="<?php echo $city; ?>" placeholder="<?php echo $entry_city; ?>" id="input-city" class="form-control" />
                <?php if ($error_city) { ?>
                <div class="text-danger"><?php echo $error_city; ?></div>
                <?php } ?>
              </div>
            </div>
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-postcode"><?php echo $entry_postcode; ?></label>
              <div class="col-sm-10">
                <input type="text" name="postcode" value="<?php echo $postcode; ?>" placeholder="<?php echo $entry_postcode; ?>" id="input-postcode" class="form-control" />
                <?php if ($error_postcode) { ?>
                <div class="text-danger"><?php echo $error_postcode; ?></div>
                <?php } ?>
              </div>
            </div>
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-country"><?php echo $entry_country; ?></label>
              <div class="col-sm-10">
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
                <?php if ($error_country) { ?>
                <div class="text-danger"><?php echo $error_country; ?></div>
                <?php } ?>
              </div>
            </div>
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-zone"><?php echo $entry_zone; ?></label>
              <div class="col-sm-10">
                <select name="zone_id" id="input-zone" class="form-control">
                </select>
                <?php if ($error_zone) { ?>
                <div class="text-danger"><?php echo $error_zone; ?></div>
                <?php } ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label"><?php echo $entry_default; ?></label>
              <div class="col-sm-10">
                <?php if ($default) { ?>
                <div class="radio radio-inline">
                  <label for="default-1" class="checked">
                    <input type="radio" id="default-1" name="default" value="1" checked="checked" />
                    <?php echo $text_yes; ?>
                  </label>
                </div>
                <div class="radio radio-inline">
                  <label for="default-0">
                    <input type="radio" id="default-0" name="default" value="0" />
                    <?php echo $text_no; ?>
                  </label>
                </div>
                <?php } else { ?>
                <div class="radio radio-inline">
                  <label for="default-1">
                    <input type="radio" id="default-1" name="default" value="1" />
                    <?php echo $text_yes; ?>
                  </label>
                </div>
                <div class="radio radio-inline">
                  <label for="default-0" class="checked">
                    <input type="radio" id="default-0" name="default" value="0" checked="checked" />
                    <?php echo $text_no; ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
          </fieldset>
        </div>
        <div class="buttons clearfix">
          <div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-default"><?php echo $button_back; ?></a></div>
          <div class="pull-right">
            <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary" />
          </div>
        </div>
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
$('select[name=\'country_id\']').bind('change', function() {
        $.ajax({
                url: 'index.php?route=account/address/country&country_id=' + this.value,
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

<?php echo $footer; ?>