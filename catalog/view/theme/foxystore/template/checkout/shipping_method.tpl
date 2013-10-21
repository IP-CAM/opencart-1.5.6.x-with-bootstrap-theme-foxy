<?php if ($error_warning) { ?>
<div class="alert alert-warning"><i class="icon-exclamation-sign"></i> <?php echo $error_warning; ?></div>
<?php } ?>
<?php if ($shipping_methods) { ?>
<p><?php echo $text_shipping_method; ?></p>
<?php $count = 0;  ?>
<form>
<?php foreach ($shipping_methods as $shipping_method) { ?>
<div class="pull-left delivery-title" title="<?php echo $shipping_method['title']; ?>"><strong><?php echo $shipping_method['title']; ?></strong></div>
<?php if (!$shipping_method['error']) { ?>
<?php foreach ($shipping_method['quote'] as $quote) { ?>
<?php $count++;  ?>
<div class="radio">
  <?php if ($quote['code'] == $code || !$code) { ?>
  <?php $code = $quote['code']; ?>
  <label for="shipping_method-<?php echo $count; ?>" class="checked">
    <input type="radio" id="shipping_method-<?php echo $count; ?>" name="shipping_method" value="<?php echo $quote['code']; ?>" checked="checked" />
    <?php echo $quote['title']; ?> - <?php echo $quote['text']; ?>
  </label>
  <?php } else { ?>
  <label for="shipping_method-<?php echo $count; ?>">
    <input type="radio" id="shipping_method-<?php echo $count; ?>" name="shipping_method" value="<?php echo $quote['code']; ?>" />
    <?php echo $quote['title']; ?> - <?php echo $quote['text']; ?>
  </label>
  <?php } ?>
</div>
<?php } ?>
<?php } else { ?>
<div class="alert alert-danger"><?php echo $shipping_method['error']; ?></div>
<?php } ?>
<?php } ?>
</form>
<?php } ?>
<p><strong><?php echo $text_comments; ?></strong></p>
<p>
  <textarea name="comment" rows="8" class="form-control"><?php echo $comment; ?></textarea>
</p>
<div class="buttons">
  <div class="pull-right w">
    <input type="button" value="<?php echo $button_continue; ?>" id="button-shipping-method" class="btn btn-primary" />
  </div>
</div>
<script type="text/javascript">$('select').selectpicker();</script>
<script type="text/javascript">
  // Style form radio btn
  $('input[type=radio]').on('change', function () {
    var $this = $(this),
      name = $this.attr('name'),
      form  = $this.closest('form');

    form.find('input[name="' + name + '"]').parent().removeClass('checked');
    form.find('input[name="' + name + '"]:checked').parent().addClass('checked');
  });
</script>