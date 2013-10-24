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
      <?php if ($profiles) { ?>

        <table class="table table-bordered table-hover">
            <thead>
            <tr>
                <td class="left"><?php echo $column_profile_id; ?></td>
                <td class="left"><?php echo $column_created; ?></td>
                <td class="left"><?php echo $column_status; ?></td>
                <td class="left"><?php echo $column_product; ?></td>
                <td class="right"><?php echo $column_action; ?></td>
            </tr>
            </thead>
            <tbody>
            <?php if ($profiles) { ?>
            <?php foreach ($profiles as $profile) { ?>
            <tr>
                <td class="left">#<?php echo $profile['id']; ?></td>
                <td class="left"><?php echo $profile['created']; ?></td>
                <td class="left"><?php echo $status_types[$profile['status']]; ?></td>
                <td class="left"><?php echo $profile['name']; ?></td>
                <td class="right"><a href="<?php echo $profile['href']; ?>"><img src="catalog/view/theme/default/image/info.png" alt="<?php echo $button_view; ?>" title="<?php echo $button_view; ?>" /></a></td>
            </tr>
            <?php } ?>
            <?php } else { ?>
            <tr>
                <td class="center" colspan="5"><?php echo $text_empty; ?></td>
            </tr>
            <?php } ?>
            </tbody>
        </table>

      <div class="pagination"><?php echo $pagination; ?></div>
      <?php } else { ?>
        <p><?php echo $text_empty; ?></p>
      <?php } ?>

      <div class="buttons">
        <div class="right">
          <a href="<?php echo $continue; ?>" class="btn btn-default"><?php echo $button_continue; ?></a>
        </div>
      </div>
    </div>
    <?php if (trim($column_right) AND ! trim($column_left)): ?>
      <div class="col-lg-3 col-md-4 col-sm-4 hidden-xs">
        <?php echo $column_right; ?>
      </div>
    <?php endif ?>
  </div>
</div>

<?php echo $footer; ?>