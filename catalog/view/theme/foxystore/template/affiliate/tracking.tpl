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
      <p><?php echo $text_description; ?></p>

      <form class="form-horizontal">
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-code"><?php echo $text_code; ?></label>
          <div class="col-sm-10">
            <textarea cols="40" rows="5" placeholder="<?php echo $text_code; ?>" id="input-code" class="form-control"><?php echo $code; ?></textarea>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-generator"><?php echo $text_generator; ?></label>
          <div class="col-sm-10">
            <input type="text" name="product" value="" id="input-generator" class="form-control" /></div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-link"><?php echo $text_link; ?></label>
          <div class="col-sm-10">
            <textarea name="link" cols="40" rows="5" id="input-link" class="form-control"></textarea>
          </div>
        </div>
      </form>
      <div class="buttons clearfix">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>

      
    </div>
    <?php if (trim($column_right) AND ! trim($column_left)): ?>
      <div class="col-lg-3 col-md-4 col-sm-4 hidden-xs">
        <?php echo $column_right; ?>
      </div>
    <?php endif ?>
  </div>
</div>

<script type="text/javascript" src="/catalog/view/theme/foxystore/js/jquery-ui-1.10.3.custom.min.js"></script>
<script type="text/javascript"><!--
$('input[name=\'product\']').autocomplete({
        'source': function(request, response) {
                $.ajax({
                        url: 'index.php?route=affiliate/tracking/autocomplete&filter_name=' +  encodeURIComponent(request.term),
                        dataType: 'json',                        
                        success: function(json) {
                                response($.map(json, function(item) {
                                        return {
                                                label: item['name'],
                                                value: item['link']
                                        }
                                }));
                        }
                });
        },
        'select': function(e, data) {
            $('input[name=\'product\']').val(data.item['label']);
            $('textarea[name=\'link\']').val(data.item['value']);
        }        
});
//--></script> 

<?php echo $content_bottom; ?><?php echo $footer; ?>