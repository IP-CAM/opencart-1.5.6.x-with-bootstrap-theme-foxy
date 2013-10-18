<?php if (count($currencies) > 1) { ?>
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="currency pull-left">

  <span class="currency-title"><?php echo $text_currency; ?></span>
    <?php foreach ($currencies as $currency) { ?>
        <?php if ($currency['code'] == $currency_code) { ?>
            <?php if ($currency['symbol_left']) { ?>
                <a title="<?php echo $currency['title']; ?>" class="btn btn-primary btn-xs active"><?php echo $currency['symbol_left']; ?></a>
            <?php } else { ?>
                <a title="<?php echo $currency['title']; ?>" class="btn btn-primary btn-xs active"><?php echo $currency['symbol_right']; ?></a>
            <?php } ?>
        <?php } else { ?>
            <?php if ($currency['symbol_left']) { ?>
                <a title="<?php echo $currency['title']; ?>" class="btn btn-primary btn-xs" onclick="$('input[name=\'currency_code\']').attr('value', '<?php echo $currency['code']; ?>'); $(this).closest('form').submit();"><?php echo $currency['symbol_left']; ?></a>
            <?php } else { ?>
                <a title="<?php echo $currency['title']; ?>" class="btn btn-primary btn-xs" onclick="$('input[name=\'currency_code\']').attr('value', '<?php echo $currency['code']; ?>'); $(this).closest('form').submit();"><?php echo $currency['symbol_right']; ?></a>
        <?php } ?>
        <?php } ?>
    <?php } ?>
    <input type="hidden" name="currency_code" value="" />
    <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
</form>
<?php } ?>