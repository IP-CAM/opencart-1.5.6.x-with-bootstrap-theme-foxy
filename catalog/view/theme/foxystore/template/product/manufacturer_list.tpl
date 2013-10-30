<?php echo $header; ?><?php echo $content_top; ?>

<!-- Content -->
<div class="container">
  <div class="row">
    <?php if (trim($column_left)): ?>
      <div class="col-lg-3 col-md-4 col-sm-4 hidden-xs">
        <?php echo $column_left; ?>
      </div>
      <div class="col-lg-9 col-md-8 col-sm-8 the-content manufacturers">
    <?php elseif (trim($column_right)): ?>
      <div class="col-lg-9 col-md-8 col-sm-8 the-content manufacturers">
    <?php else: ?>
      <div class="col-lg-12 the-content manufacturers">
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

      <!-- Mafunacturers -->
      <?php if ($categories) { ?>
        <p><strong><?php echo $text_index; ?></strong>
          <?php foreach ($categories as $category) { ?>
          &nbsp;&nbsp;&nbsp;<a href="index.php?route=product/manufacturer#<?php echo $category['name']; ?>"><?php echo $category['name']; ?></a>
          <?php } ?>
        </p>
        <?php foreach ($categories as $category) { ?>
        <h2 id="<?php echo $category['name']; ?>"><?php echo $category['name']; ?></h2>
        <?php if ($category['manufacturer']) { ?>
        <div class="row">
          <?php for ($i = 0; $i < count($category['manufacturer']);) { ?>
          <?php $j = $i + ceil(count($category['manufacturer']) / 4); ?>
          <?php for (; $i < $j; $i++) { ?>
          <?php if (isset($category['manufacturer'][$i])) { ?>
          <div class="col-sm-4"><a href="<?php echo $category['manufacturer'][$i]['href']; ?>"><?php echo $category['manufacturer'][$i]['name']; ?></a></div>
          <?php } ?>
          <?php } ?>
          <?php } ?>
        </div>
        <?php } ?>
        <?php } ?>
        <?php } else { ?>
        <p><?php echo $text_empty; ?></p>
        <div class="buttons clearfix">
          <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
        </div>
      <?php } ?>
    </div>
    <?php if (trim($column_right) AND ! trim($column_left)): ?>
      <div class="col-lg-3 col-md-4 col-sm-4 hidden-xs">
        <?php echo $column_right; ?>
      </div>
    <?php endif ?>
  </div>
</div>


<?php echo $content_bottom; ?><?php echo $footer; ?>