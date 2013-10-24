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
        <fieldset>
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
                  <label for="newsletter-0">
                    <input type="radio" id="newsletter-0" name="newsletter" value="0" />
                    <?php echo $text_no; ?>
                  </label>
                </div>
              <?php } else { ?>
                <div class="radio radio-inline">
                  <label for="newsletter-1">
                    <input type="radio" id="newsletter-1" name="newsletter" value="1" />
                    <?php echo $text_yes; ?>
                  </label>
                </div>
                <div class="radio radio-inline">
                  <label for="newsletter-0" class="checked">
                    <input type="radio" id="newsletter-0" name="newsletter" value="0" checked="checked" />
                    <?php echo $text_no; ?>
                  </label>
                </div>
              <?php } ?>
            </div>
          </div>
        </fieldset>
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

<?php echo $footer; ?>