<?php if ($error_warning) { ?>
<div class="alert alert-warning"><i class="icon-exclamation-sign"></i> <?php echo $error_warning; ?></div>
<?php } ?>
<?php if ($payment_methods) { ?>
<p><?php echo $text_payment_method; ?></p>
<form>
<?php $count = 0; ?>
<?php foreach ($payment_methods as $payment_method) { ?>
<?php $count++; ?>
<div class="radio">
    <?php if ($payment_method['code'] == $code || !$code) { ?>
    <?php $code = $payment_method['code']; ?>
    <label for="payment_method-<?php echo $count; ?>" class="checked">
      <input type="radio" name="payment_method" id="payment_method-<?php echo $count; ?>" value="<?php echo $payment_method['code']; ?>" checked="checked" />
      <?php echo $payment_method['title']; ?>
    </label>
    <?php } else { ?>
    <label for="payment_method-<?php echo $count; ?>">
      <input type="radio" id="payment_method-<?php echo $count; ?>" name="payment_method" value="<?php echo $payment_method['code']; ?>" />
      <?php echo $payment_method['title']; ?>
    </label>
    <?php } ?>
</div>
<?php } ?>
</form>
<?php } ?>
<p><strong><?php echo $text_comments; ?></strong></p>
<p>
  <textarea name="comment" rows="8" class="form-control"><?php echo $comment; ?></textarea>
</p>
<?php if ($text_agree) { ?>
<div class="buttons">
  <div class="pull-right">
    <div class="checkbox">
      <?php if ($agree) { ?>
        <label for="agree-1" class="checked">
          <input type="checkbox" name="agree" id="agree-1" value="1" checked="checked" />
          <?php echo $text_agree; ?>
        </label>
      <?php } else { ?>
        <label for="agree-2">
          <input type="checkbox" name="agree" id="agree-2" value="0" />
          <?php echo $text_agree; ?>
        </label>
      <?php } ?>
    </div>
    &nbsp;
    <input type="button" value="<?php echo $button_continue; ?>" id="button-payment-method" class="btn btn-primary" />
  </div>
</div>
<?php } else { ?>
<div class="buttons">
  <div class="pull-right w">
    <input type="button" value="<?php echo $button_continue; ?>" id="button-payment-method" class="btn btn-primary" />
  </div>
</div>
<?php } ?>
<script type="text/javascript">
  $('select').selectpicker();

  $('input[type=checkbox]').on('change', function () {
      $(this).parent().toggleClass('checked');
  });

  $('input[type=radio]').on('change', function () {
    var $this = $(this),
      name = $this.attr('name'),
      form  = $this.closest('form');

    form.find('input[name="' + name + '"]').parent().removeClass('checked');
    form.find('input[name="' + name + '"]:checked').parent().addClass('checked');
  });
</script>