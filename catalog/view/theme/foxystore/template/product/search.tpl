<?php echo $header; ?>

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

      <!-- Catalog view -->
      <div class="row catalog-view search-filter">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
          <?php if ($search) { ?>
          <input class="input-medium" type="text" name="search" value="<?php echo $search; ?>" />
          <?php } else { ?>
          <input class="input-medium" type="text" name="search" value="<?php echo $search; ?>" onclick="this.value = '';" onkeydown="this.style.color = '000000'" style="color: #999;" />
          <?php } ?>

          <select name="category_id">
            <option value="0"><?php echo $text_category; ?></option>
            <?php foreach ($categories as $category_1) { ?>
            <?php if ($category_1['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
            <?php } ?>
            <?php foreach ($category_1['children'] as $category_2) { ?>
            <?php if ($category_2['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
            <?php } ?>
            <?php foreach ($category_2['children'] as $category_3) { ?>
            <?php if ($category_3['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
            <?php } ?>
            <?php } ?>
            <?php } ?>
            <?php } ?>
          </select>

          <input type="button" value="<?php echo $button_search; ?>" id="button-search" class="btn btn-default" />

          <div class="checkbox">
            <?php if ($sub_category) { ?>
              <label for="sub_category" class="checked">
                <input type="checkbox" name="sub_category" value="1" id="sub_category" checked="checked" />
                <?php echo $text_sub_category; ?>
              </label>
            <?php } else { ?>
              <label for="sub_category">
                <input type="checkbox" name="sub_category" value="1" id="sub_category" />
                <?php echo $text_sub_category; ?>
              </label>
            <?php } ?>
          </div>


          <div class="checkbox">
            <?php if ($description) { ?>
              <label for="description" class="checked">
                <input type="checkbox" name="description" value="1" id="description" checked="checked" />
                <?php echo $entry_description; ?>
              </label>
            <?php } else { ?>
              <label for="description">
                <input type="checkbox" name="description" value="1" id="description" />
                <?php echo $entry_description; ?>
              </label>
            <?php } ?>
          </div>
        </div>
      </div><!-- end .catalog-view -->

      <!-- Products -->
      <?php if ($products) { ?>
        <div class="row catalog" id="products-grid-container">

          <?php foreach ($products as $product) { ?>
            <!-- Check if product is already in wishlist -->
            <?php 
              $in_compare = 
                isset($this->session->data['compare']) 
                ? in_array($product['product_id'], $this->session->data['compare']) 
                : false;

              $in_wishlist = 
                isset($this->session->data['wishlist']) 
                ? in_array($product['product_id'], $this->session->data['wishlist']) 
                : false;
            ?>

            <?php if ( ! trim($column_left) AND ! trim($column_right)): ?>
              <div class="product-preview-block-<?php echo $product['product_id']; ?> col-lg-3 col-md-4 col-sm-4">
            <?php else: ?>
              <div class="product-preview-block-<?php echo $product['product_id']; ?> col-lg-4 col-md-6 col-sm-6">
            <?php endif ?>
              <div class="img-holder">
                <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" title="" alt=""></a>
                <a href="#" class="quick-view-btn btn hidden-xs">Quick view</a>
              </div>
              <a href="<?php echo $product['href']; ?>" class="title"><?php echo $product['name']; ?></a>
              <hr class="short">
              <span class="cat">Mp3 players</span>
              <span class="actual-price pR">
                <?php if ($product['price']) { ?>
                  <div class="price">
                    <?php if (!$product['special']) { ?>
                      <?php echo $product['price']; ?>
                    <?php } else { ?>
                      <?php echo $product['special']; ?>
                      <span class="sale-price"><?php echo $product['price']; ?></span>
                    <?php } ?>
                  </div>
                <?php } ?>
              </span>

              <!-- Add to cart btn -->
              <a href="#" onclick="addToCart('<?php echo $product['product_id']; ?>'); return false;" class="btn btn-basket"><span class="glyphicon glyphicon-shopping-cart"></span><?php echo $button_cart; ?></a>

              <!-- Product icons -->
              <div class="product-icon-holder">
                <!-- Add to wishlist btn -->
                <?php if ($in_wishlist): ?>
                  <a href="#" data-product-id="<?php echo $product['product_id']; ?>" class="active rounded-icon fav tooltiped" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" data-placement="left"><span class="glyphicon glyphicon-heart"></span></a>
                <?php else: ?>
                  <a href="#" data-product-id="<?php echo $product['product_id']; ?>" class="rounded-icon fav tooltiped" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" data-placement="left"><span class="glyphicon glyphicon-heart"></span></a>
                <?php endif ?>

                <!-- Add to compare btn -->
                <?php if ($in_compare): ?>
                  <a href="#" data-product-id="<?php echo $product['product_id']; ?>" class="active rounded-icon compare tooltiped" data-toggle="tooltip" title="<?php echo $button_compare; ?>" data-placement="left"><span class="glyphicon glyphicon-stats"></span></a>
                <?php else: ?>
                  <a href="#" data-product-id="<?php echo $product['product_id']; ?>" class="rounded-icon compare tooltiped" data-toggle="tooltip" title="<?php echo $button_compare; ?>" data-placement="left"><span class="glyphicon glyphicon-stats"></span></a>
                <?php endif ?>
              </div>

              <!-- Product quick view -->
              <div class="quick-product-info hidden-xs">
                <div class="col-lg-12 the-content">
                  <div class="row product-info">
                    <div class="col-lg-6 col-md-6 col-sm-12">
                      <?php if ($product['images']) { ?>
                        <div class="quick-prouct-image-lg-<?php echo $product['product_id']; ?> quick-prouct-image-lg prouct-image-lg">
                          <div class="quick-prouct-image-lg-id">
                            <?php foreach ($product['images'] as $product_image) { ?>
                              <a href="<?php echo $product['popup']; ?>" title="<?php echo $heading_title; ?>"><img src="<?php echo $product['popup']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
                              <a href="<?php echo $product_image['popup']; ?>" title="<?php echo $heading_title; ?>"><img src="<?php echo $product_image['popup']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
                            <?php } ?>
                          </div>
                          <a href="#" class="quick-prouct-image-lg-prev quick-prouct-image-lg-navigation hidden-sm"><span class="glyphicon glyphicon-chevron-left"></span></a>
                          <a href="#" class="quick-prouct-image-lg-next quick-prouct-image-lg-navigation hidden-sm"><span class="glyphicon glyphicon-chevron-right"></span></a>
                        </div>
                      <?php } ?>
                    </div>
                    <div class="product-preview-block-popup-<?php echo $product['product_id']; ?> col-lg-6 col-md-6 col-sm-12">
                      <h1><?php echo $product['name']; ?></h1>

                      <hr class="short">

                      <!-- Prices -->
                      <?php if ($product['price']) { ?>
                        <div class="price">
                          <?php if (!$product['special']) { ?>
                            <span class="actual"><?php echo $product['price']; ?></span>
                          <?php } else { ?>
                            <div class="actual"><?php echo $product['price']; ?></div>
                            <div class="discount"><?php echo $product['special']; ?></div>
                          <?php } ?>

                          <?php if ($product['points']) { ?>
                            <div class="tax"><?php echo $text_points; ?> <?php echo $product['points']; ?></div>
                          <?php } ?>
                          
                          <?php if ($product['tax']) { ?>
                            <span class="tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                          <?php } ?>

                          <?php if ($product['discounts']) { ?>
                            <hr class="small" />

                            <div class="tax">
                              <?php foreach ($product['discounts'] as $discount) { ?>
                                <?php echo sprintf($text_discount, $discount['quantity'], $discount['price']); ?><br />
                              <?php } ?>
                            </div>
                          <?php } ?>
                        </div>
                      <?php } ?>

                      <!-- Rating -->
                      <div class="review-info">
                        <span class="rating"><img src="/catalog/view/theme/foxystore/img/product-rating-<?php echo $product['rating']; ?>.png"></span>
                        <span class="total"><?php echo $product['reviews']; ?></span>
                      </div>

                      <!-- Attributes -->
                      <div class="attrs pull-left w">
                        <!-- Manufacturer -->
                        <?php if ($product['manufacturer']) { ?>
                          <div class="col-sm-4 col-xs-6 dark"><?php echo $text_manufacturer; ?></div>
                          <div class="col-sm-8 col-xs-6"><a href="<?php echo $product['manufacturers']; ?>"><?php echo $product['manufacturer']; ?></a></div>
                        <?php } ?>

                        <!-- Model -->
                        <div class="col-sm-4 col-xs-6 dark"><?php echo $text_model; ?></div>
                        <div class="col-sm-8 col-xs-6"><?php echo $product['model']; ?></div>

                        <!-- Reward -->
                        <?php if ($product['reward']) { ?>
                          <div class="col-sm-4 col-xs-6 dark"><?php echo $text_reward; ?></div>
                          <div class="col-sm-8 col-xs-6"><?php echo $product['reward']; ?></div>
                        <?php } ?>

                        <!-- Stock -->
                        <div class="col-sm-4 col-xs-6 dark"><?php echo $text_stock; ?></div>
                        <div class="col-sm-8 col-xs-6"><span class="green"><?php echo $product['stock']; ?></span></div>
                      </div>


                      <!-- PRICE BOX -->
                      <div class="price-box pull-left w">
                        <div class="col-sm-6 col-xs-12 pull-left">
                          <span class="pull-left"><?php echo $text_qty; ?></span>
                          <div class="input-type-number">
                            <input type="text" value="<?php echo $product['minimum']; ?>" min="<?php echo $product['minimum']; ?>" class="number">
                            <a href="#" class="up" data-num="1"></a>
                            <a href="#" class="down" data-num="-1"></a>
                          </div>
                        </div>
                        <div class="col-sm-6 col-xs-12 pull-left">
                          <a href="#" class="btn btn-basket" onclick="addToCart('<?php echo $product['product_id']; ?>'); return false;">
                            <span class="glyphicon glyphicon-shopping-cart"></span>
                            <?php echo $button_cart; ?>
                          </a>
                        </div>
                      </div>

                      <!-- Wishlist btn -->
                      <!-- Check if product is already in wishlist -->
                      <?php 
                        $in_compare = 
                          isset($this->session->data['compare']) 
                          ? in_array($product['product_id'], $this->session->data['compare']) 
                          : false;

                        $in_wishlist = 
                          isset($this->session->data['wishlist']) 
                          ? in_array($product['product_id'], $this->session->data['wishlist']) 
                          : false;
                      ?>

                      <div class="buttons pull-left w">
                        <!-- Compare btn -->
                        <?php if ($in_compare): ?>
                          <a href="#" data-product-id="<?php echo $product['product_id']; ?>" class="compare active action-button btn btn-grey col-xs-12 col-sm-4">
                            <span class="glyphicon glyphicon-stats"></span>
                            <?php echo $button_compare; ?>
                          </a>
                        <?php else: ?>
                          <a href="#" data-product-id="<?php echo $product['product_id']; ?>" class="compare action-button btn btn-grey col-xs-12 col-sm-4">
                            <span class="glyphicon glyphicon-stats"></span>
                          <?php echo $button_compare; ?>
                          </a>
                        <?php endif ?>

                        <!-- Wishlist btn -->
                        <?php if ($in_wishlist): ?>
                          <a href="#" data-product-id="<?php echo $product['product_id']; ?>" class="active fav action-button btn btn-grey col-xs-12 col-sm-4">
                            <span class="glyphicon glyphicon-heart"></span>
                            <?php echo $button_wishlist; ?>
                          </a>
                        <?php else: ?>
                          <a href="#" data-product-id="<?php echo $product['product_id']; ?>" class="fav action-button btn btn-grey col-xs-12 col-sm-4">
                            <span class="glyphicon glyphicon-heart"></span>
                            <?php echo $button_wishlist; ?>
                          </a>
                        <?php endif ?>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          <?php } ?>
        </div>
      <?php } ?>

      <!-- No categories or products -->
      <?php if (!$products) { ?>
        <h3><?php echo $text_empty; ?></h3>
      <?php } ?>
    </div>
    <?php if (trim($column_right) AND ! trim($column_left)): ?>
      <div class="col-lg-3 col-md-4 col-sm-4 hidden-xs">
        <?php echo $column_right; ?>
      </div>
    <?php endif ?>
  </div>
</div>


<script type="text/javascript"><!--
    $('.the-content input[name=\'search\']').keydown(function(e) {
      if (e.keyCode == 13) {
        $('#button-search').trigger('click');
      }
    });

    $('select[name=\'category_id\']').change(function() {
      if (this.value == '0') {
        $('input[name=\'sub_category\']').attr('disabled', 'disabled').closest('label').addClass('disabled');
        $('input[name=\'sub_category\']').removeAttr('checked').closest('label').removeClass('checked').addClass('disabled');
      } else {
        $('input[name=\'sub_category\']').removeAttr('disabled').closest('label').removeClass('disabled');
      }
    });

    $('select[name=\'category_id\']').trigger('change');

    $('#button-search').click(function(e) {
      url = 'index.php?route=product/search';
      
      var search = $('.the-content input[name=\'search\']').val();
      
      if (search) {
        url += '&search=' + encodeURIComponent(search);
      }

      var category_id = $('.the-content select[name=\'category_id\']').val();
      
      if (category_id > 0) {
        url += '&category_id=' + encodeURIComponent(category_id);
      }
      
      var sub_category = $('.the-content input[name=\'sub_category\']:checked').val();
      
      if (sub_category) {
        url += '&sub_category=true';
      }
        
      var filter_description = $('.the-content input[name=\'description\']:checked').val();
      
      if (filter_description) {
        url += '&description=true';
      }

      location = url;

      e.preventDefault();
    });
--></script>

<?php echo $footer; ?>