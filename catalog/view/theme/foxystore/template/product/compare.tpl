<?php echo $header; ?><?php echo $content_top; ?>

<!-- Content -->
<div class="container">
  <div class="row">
    <?php if (trim($column_left)): ?>
      <div class="col-lg-3 col-md-4 col-sm-4 hidden-xs">
        <?php echo $column_left; ?>
      </div>
      <div class="col-lg-9 col-md-8 col-sm-8 the-content">
    <?php elseif (trim($column_right)): ?>
      <div class="col-lg-9 col-md-8 col-sm-8 the-content">
    <?php else: ?>
      <div class="col-lg-12 the-content">
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

      <!-- Products -->
      <?php if ($products) { ?>
        <table class="cart table-wishlist">
          <thead>
            <tr>
              <th class="compare-product" colspan="<?php echo count($products) + 1; ?>"><?php echo $text_product; ?></th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><?php echo $text_name; ?></td>
              <?php foreach ($products as $product) { ?>
              <td class="name"><a href="<?php echo $products[$product['product_id']]['href']; ?>"><?php echo $products[$product['product_id']]['name']; ?></a></td>
              <?php } ?>
            </tr>
            <tr>
              <td><?php echo $text_image; ?></td>
              <?php foreach ($products as $product) { ?>
              <td><?php if ($products[$product['product_id']]['thumb']) { ?>
                <img src="<?php echo $products[$product['product_id']]['thumb']; ?>" alt="<?php echo $products[$product['product_id']]['name']; ?>" />
                <?php } ?></td>
              <?php } ?>
            </tr>
            <tr>
              <td><?php echo $text_price; ?></td>
              <?php foreach ($products as $product) { ?>
              <td><?php if ($products[$product['product_id']]['price']) { ?>
                <?php if (!$products[$product['product_id']]['special']) { ?>
                <div class="price"><?php echo $products[$product['product_id']]['price']; ?></div>
                <?php } else { ?>
                <div class="price"><?php echo $products[$product['product_id']]['price']; ?><span class="price-old"><?php echo $products[$product['product_id']]['special']; ?></span></div>
                <?php } ?>
                <?php } ?></td>
              <?php } ?>
            </tr>
            <tr>
              <td><?php echo $text_model; ?></td>
              <?php foreach ($products as $product) { ?>
              <td><?php echo $products[$product['product_id']]['model']; ?></td>
              <?php } ?>
            </tr>
            <tr>
              <td><?php echo $text_manufacturer; ?></td>
              <?php foreach ($products as $product) { ?>
              <td><?php echo $products[$product['product_id']]['manufacturer']; ?></td>
              <?php } ?>
            </tr>
            <tr>
              <td><?php echo $text_availability; ?></td>
              <?php foreach ($products as $product) { ?>
              <td><?php echo $products[$product['product_id']]['availability']; ?></td>
              <?php } ?>
            </tr>
            <?php if ($review_status) { ?>
            <tr>
              <td><?php echo $text_rating; ?></td>
              <?php foreach ($products as $product) { ?>
              <td><img src="catalog/view/theme/foxystore/img/product-rating-<?php echo $products[$product['product_id']]['rating']; ?>.png" alt="<?php echo $products[$product['product_id']]['reviews']; ?>" /> <?php echo $products[$product['product_id']]['reviews']; ?></td>
              <?php } ?>
            </tr>
            <?php } ?>
            <tr>
              <td><?php echo $text_summary; ?></td>
              <?php foreach ($products as $product) { ?>
              <td class="description"><?php echo $products[$product['product_id']]['description']; ?></td>
              <?php } ?>
            </tr>
            <tr>
              <td><?php echo $text_weight; ?></td>
              <?php foreach ($products as $product) { ?>
              <td><?php echo $products[$product['product_id']]['weight']; ?></td>
              <?php } ?>
            </tr>
            <tr>
              <td><?php echo $text_dimension; ?></td>
              <?php foreach ($products as $product) { ?>
              <td><?php echo $products[$product['product_id']]['length']; ?> x <?php echo $products[$product['product_id']]['width']; ?> x <?php echo $products[$product['product_id']]['height']; ?></td>
              <?php } ?>
            </tr>
          </tbody>
          <?php foreach ($attribute_groups as $attribute_group) { ?>
          <thead>
            <tr>
              <td class="compare-attribute" colspan="<?php echo count($products) + 1; ?>"><?php echo $attribute_group['name']; ?></td>
            </tr>
          </thead>
          <?php foreach ($attribute_group['attribute'] as $key => $attribute) { ?>
          <tbody>
            <tr>
              <td><?php echo $attribute['name']; ?></td>
              <?php foreach ($products as $product) { ?>
              <?php if (isset($products[$product['product_id']]['attribute'][$key])) { ?>
              <td><?php echo $products[$product['product_id']]['attribute'][$key]; ?></td>
              <?php } else { ?>
              <td></td>
              <?php } ?>
              <?php } ?>
            </tr>
          </tbody>
          <?php } ?>
          <?php } ?>
          <tr>
            <td></td>
            <?php foreach ($products as $product) { ?>
            <td><input class="btn btn-primary" type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" />
              <a class="btn btn-danger" href="<?php echo $product['remove']; ?>"><?php echo $button_remove; ?></a></td>
            <?php } ?>
          </tr>
        </table>
      <?php } ?>

      <!-- No categories or products -->
      <?php if (!$products) { ?>
        <h3><?php echo $text_empty; ?></h3>
        <a href="<?php echo $continue; ?>" class="btn btn-basket pull-right"><?php echo $button_continue; ?></a>
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