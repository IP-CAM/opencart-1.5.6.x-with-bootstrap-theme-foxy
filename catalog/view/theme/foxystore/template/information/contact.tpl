<?php echo $header; ?><?php echo $content_top; ?>

<!-- Content -->
<div class="container">
  <div class="row">
    <?php if (trim($column_left)): ?>
      <div class="col-lg-3 col-md-4 col-sm-4 hidden-xs">
        <?php echo $column_left; ?>
      </div>
      <div class="col-lg-9 col-md-8 col-sm-8 the-content contact-page">
    <?php elseif (trim($column_right)): ?>
      <div class="col-lg-9 col-md-8 col-sm-8 the-content contact-page">
    <?php else: ?>
      <div class="col-lg-12 the-content contact-page">
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
      <h3><?php echo $text_location; ?></h3>
      <div class="row">
        <div class="col-sm-3">
          <address>
          <strong><?php echo $text_address; ?></strong>
          <?php echo $store; ?>
          <?php echo $address; ?><br>
          <?php if ($telephone) { ?>
          <abbr title="<?php echo $text_telephone; ?>"><?php echo $text_telephone; ?></abbr>
          <?php echo $telephone; ?><br>
          <?php } ?>
          <?php if ($fax) { ?>
          <?php echo $text_fax; ?><br>
          <?php echo $fax; ?><br>
          <?php } ?>
          </address>
        </div>
      </div>

        <div class="options">
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="review-form">
                <h3><?php echo $text_contact; ?></h3>

                <table class="w">
                    <tr>
                        <td><span>*</span> <?php echo $entry_name; ?></td>
                        <td>
                            <input type="text" name="name" value="<?php echo $name; ?>" id="input-name" class="form-control" />
                            <?php if ($error_name) { ?>
                            <div class="text-danger"><?php echo $error_name; ?></div>
                            <?php } ?>
                        </td>
                    </tr>
                    <tr>
                        <td><span>*</span> <?php echo $entry_email; ?></td>
                        <td>
                            <input type="text" name="email" value="<?php echo $email; ?>" id="input-email" class="form-control" />
                            <?php if ($error_email) { ?>
                            <div class="text-danger"><?php echo $error_email; ?></div>
                            <?php } ?>
                        </td>
                    </tr>
                    <tr class="review-text">
                        <td><span>*</span> <?php echo $entry_enquiry; ?></td>
                        <td>
                            <textarea name="enquiry"><?php echo $enquiry; ?></textarea>
                            <?php if ($error_enquiry) { ?>
                            <div class="text-danger"><?php echo $error_enquiry; ?></div>
                            <?php } ?>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span>*</span> <?php echo $entry_captcha; ?>
                        </td>
                        <td>
                            <div class="row">
                                <div class="col-lg-12 col-md-12"><img src="index.php?route=product/product/captcha" alt="" id="captcha" /></div>
                                
                                <div class="col-lg-12 col-md-12"><input type="text" name="captcha" value="" /></div>

                                <?php if ($error_captcha) { ?>
                                <div class="col-lg-12"><span class="text-danger"><?php echo $error_captcha; ?></span></div>
                                <?php } ?>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <a href="#" class="btn btn-darkgrey" onclick="$(this).closest('form').submit(); return false;"><?php echo $button_continue; ?></a>
                        </td>
                    </tr>
                </table>
            </form>
        </div>

    </div>
    <?php if (trim($column_right) AND ! trim($column_left)): ?>
      <div class="col-lg-3 col-md-4 col-sm-4 hidden-xs">
        <?php echo $column_right; ?>
      </div>
    <?php endif ?>
  </div>
</div>

<?php echo $content_bottom; ?><?php echo $footer; ?>