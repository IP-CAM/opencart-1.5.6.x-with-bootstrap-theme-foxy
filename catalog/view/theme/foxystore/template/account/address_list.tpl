<?php echo $header; ?>

<!-- Content -->
<div class="container">
  <div class="row">
    <div class="col-lg-3 col-md-4 col-sm-4">
      <?php echo $column_left; ?>
    </div>
    <div class="col-lg-9 col-md-8 col-sm-8 the-content">

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
      <table class="table table-bordered table-hover">
        <?php foreach ($addresses as $result) { ?>
        <tr>
          <td class="text-left"><?php echo $result['address']; ?></td>
          <td class="text-right"><a href="<?php echo $result['update']; ?>" class="btn btn-default"><?php echo $button_edit; ?></a> &nbsp; <a href="<?php echo $result['delete']; ?>" class="btn btn-default"><?php echo $button_delete; ?></a></td>
        </tr>
        <?php } ?>
      </table>
      <div class="buttons clearfix">
        <div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-default"><?php echo $button_back; ?></a></div>
        <div class="pull-right"><a href="<?php echo $insert; ?>" class="btn btn-primary"><?php echo $button_new_address; ?></a></div>
      </div>
    </div>
  </div>
</div>

<?php echo $footer; ?>