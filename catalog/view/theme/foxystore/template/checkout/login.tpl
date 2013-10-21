<div class="row">
  <div class="col-sm-6 checkout-customer-box">
    <form class="pull-left w">
    <h2><?php echo $text_new_customer; ?></h2>
    <p><?php echo $text_checkout; ?></p>
    <div class="radio">
      <?php if ($account == 'register') { ?>
        <label for="account-1" class="checked">
          <input type="radio" id="account-1" name="account" value="register" checked="checked" />
          <?php echo $text_register; ?>
        </label>
      <?php } else { ?>
        <label for="account-2">
          <input type="radio" id="account-2" name="account" value="register" />
          <?php echo $text_register; ?>
        </label>
      <?php } ?>
    </div>
    <?php if ($guest_checkout) { ?>
    <div class="radio">
        <?php if ($account == 'guest') { ?>
          <label for="account-3" class="checked">
            <input type="radio" id="account-3" name="account" value="guest" checked="checked" />
            <?php echo $text_guest; ?>
          </label>
        <?php } else { ?>
          <label for="account-4">
            <input type="radio" id="account-4" name="account" value="guest" />
            <?php echo $text_guest; ?>
          </label>
        <?php } ?>
    </div>
    <?php } ?>
    <p><?php echo $text_register_account; ?></p>
    <input type="button" value="<?php echo $button_continue; ?>" id="button-account" class="btn btn-primary" />
    </form>
  </div>
  <div class="col-sm-6 checkout-login-box">
    <h2><?php echo $text_returning_customer; ?></h2>
    <p><?php echo $text_i_am_returning_customer; ?></p>
    <div class="form-group">
      <label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
      <input type="text" name="email" value="" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
    </div>
    <div class="form-group">
      <label class="control-label" for="input-password"><?php echo $entry_password; ?></label>
      <input type="password" name="password" value="" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
      <a href="<?php echo $forgotten; ?>" class="forgot-password"><?php echo $text_forgotten; ?></a></div>
    <input type="button" value="<?php echo $button_login; ?>" id="button-login" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary" />
  </div>
</div>

<script type="text/javascript">
  // Style form radio btn
  $('input[type=radio]').on('change', function () {
    var $this = $(this),
      name = $this.attr('name'),
      form  = $this.closest('form');

    form.find('input[name="' + name + '"]').parent().removeClass('checked');
    form.find('input[name="' + name + '"]:checked').parent().addClass('checked');
    console.log(form.find('input[name="' + name + '"]:checked'));
  });
</script>