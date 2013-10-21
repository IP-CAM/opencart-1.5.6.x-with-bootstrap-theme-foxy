<?php if (!isset($redirect)) { ?>
<table class="table table-bordered table-hover">
  <thead>
    <tr>
      <td class="text-left"><?php echo $column_name; ?></td>
      <td class="text-left hidden-xs"><?php echo $column_model; ?></td>
      <td class="text-right"><?php echo $column_quantity; ?></td>
      <td class="text-right hidden-xs"><?php echo $column_price; ?></td>
      <td class="text-right"><?php echo $column_total; ?></td>
    </tr>
  </thead>
  <tbody>
    <?php foreach ($products as $product) { ?>
    <tr>
      <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
        <?php foreach ($product['option'] as $option) { ?>
        <br />
        &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
        <?php } ?></td>
      <td class="text-left hidden-xs"><?php echo $product['model']; ?></td>
      <td class="text-right"><?php echo $product['quantity']; ?></td>
      <td class="text-right hidden-xs"><?php echo $product['price']; ?></td>
      <td class="text-right"><?php echo $product['total']; ?></td>
    </tr>
    <?php } ?>
    <?php foreach ($vouchers as $voucher) { ?>
    <tr>
      <td class="text-left"><?php echo $voucher['description']; ?></td>
      <td class="text-left hidden-xs"></td>
      <td class="text-right">1</td>
      <td class="text-right hidden-xs"><?php echo $voucher['amount']; ?></td>
      <td class="text-right"><?php echo $voucher['amount']; ?></td>
    </tr>
    <?php } ?>
  </tbody>
</table>
<div class="pull-left w">
  <div class="cart-totals pull-right">
    <?php foreach ($totals as $total) { ?>
      <?php if ($total['code'] == 'total'): ?>
        <h6 class="total"><?php echo $total['title']; ?>:<span><?php echo $total['text']; ?></span></h6>
      <?php else: ?>
        <h6><?php echo $total['title']; ?>:<span><?php echo $total['text']; ?></span></h6>
      <?php endif ?>
    <?php } ?>
  </div>
</div>
<?php echo $payment; ?>
<?php } else { ?>
<script type="text/javascript"><!--
location = '<?php echo $redirect; ?>';
//--></script>
<?php } ?>