<?php echo $header; ?><?php echo $content_top; ?>

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

      <?php if ($success) { ?>
      <div class="alert alert-success"><?php echo $success; ?></div>
      <?php } ?>
      <?php if ($error) { ?>
      <div class="alert alert-danger"><?php echo $error; ?></div>
      <?php } ?>

      <!-- Content -->
      <table class="list">
        <thead>
          <tr>
            <td class="left" colspan="2"><?php echo $text_recurring_detail; ?></td>
          </tr>
        </thead>
        <tbody>
        <tr>
            <td class="left" style="width: 50%;">
                <p style="margin:5px;"><b><?php echo $text_recurring_id; ?></b> #<?php echo $profile['order_recurring_id']; ?></p>
                <p style="margin:5px;"><b><?php echo $text_date_added; ?></b> <?php echo $profile['created']; ?></p>
                <p style="margin:5px;"><b><?php echo $text_status; ?></b> <?php echo $status_types[$profile['status']]; ?></p>
                <p style="margin:5px;"><b><?php echo $text_payment_method; ?></b> <?php echo $profile['payment_method']; ?></p>
            </td>
            <td class="left" style="width: 50%; vertical-align: top;">
                <p style="margin:5px;"><b><?php echo $text_product; ?></b> <a href="<?php echo $profile['product_link']; ?>"><?php echo $profile['product_name']; ?></a></p>
                <p style="margin:5px;"><b><?php echo $text_quantity; ?></b> <?php echo $profile['product_quantity']; ?></p>
                <p style="margin:5px;"><b><?php echo $text_order; ?></b> <a href="<?php echo $profile['order_link']; ?>">#<?php echo $profile['order_id']; ?></a></p>
            </td>
        </tr>
        </tbody>
      </table>
        <table class="list">
            <thead>
                <tr>
                    <td class="left"><?php echo $text_recurring_description; ?></td>
                    <td class="left"><?php echo $text_ref; ?></td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="left" style="width: 50%;"><p style="margin:5px;"><?php echo $profile['profile_description']; ?></p></td>
                    <td class="left" style="width: 50%;"><p style="margin:5px;"><?php echo $profile['profile_reference']; ?></p></td>
                </tr>
            </tbody>
      </table>
      <h2><?php echo $text_transactions; ?></h2>
      <table class="list">
        <thead>
          <tr>
            <td class="left"><?php echo $column_created; ?></td>
            <td class="center"><?php echo $column_type; ?></td>
            <td class="right"><?php echo $column_amount; ?></td>
          </tr>
        </thead>
        <tbody>
          <?php

          if(!empty($profile['transactions'])){
          foreach ($profile['transactions'] as $transaction) {

          ?>
          <tr>
            <td class="left"><?php echo $transaction['created']; ?></td>
            <td class="center"><?php echo $transaction_types[$transaction['type']]; ?></td>
            <td class="right"><?php echo $transaction['amount']; ?></td>
          </tr>
          <?php } }else{ ?>

          <tr>
              <td colspan="3" class="center"><?php echo $text_empty_transactions; ?></td>
          </tr>

        <?php } ?>
        </tbody>
      </table>

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

<script type="text/javascript"><!--
    function confirmCancel(){
        var confirmed = confirm("<?php echo $text_confirm_cancel; ?>");
        return confirmed;
    }
//--></script>

<?php echo $content_bottom; ?><?php echo $footer; ?>