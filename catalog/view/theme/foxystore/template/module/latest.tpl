<?php if ($position == 'content_top' || $position == 'content_bottom'): ?>
<div class="container">

    <h3 class="line">
      <span><?php echo $heading_title; ?></span>
      <i></i>
    </h3>

    <!-- Products -->
    <?php if ($products) { ?>
      <div class="row catalog catalog-module" id="products-grid-container">

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

            <div class="product-preview-block-<?php echo $product['product_id']; ?> col-lg-3 col-md-4 col-sm-4">
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
                          <a href="<?php echo $product['popup']; ?>" title="<?php echo $heading_title; ?>"><img src="<?php echo $product['popup']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
                          <?php foreach ($product['images'] as $product_image) { ?>
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
                          <input type="number" value="<?php echo $product['minimum']; ?>" min="<?php echo $product['minimum']; ?>" class="number">
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
<?php else: ?>
  <h4 class="sidebar-heading"><?php echo $heading_title; ?></h4>
  <div class="sidebar-block oH">
    <ul class="featured">
      <?php foreach ($products as $product) { ?>
        <li>
          <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>">
          <a class="title" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
          <span class="price">
            <?php if (!$product['special']) { ?>
              <?php echo $product['price']; ?>
            <?php } else { ?>
              <span class="price-new"><?php echo $product['special']; ?></span>
              <span class="price-old"><?php echo $product['price']; ?></span>
            <?php } ?>
          </span>
        </li>
      <?php } ?>
    </ul>
  </div>
<?php endif; ?>

<?php if ($position == 'content_top' || $position == 'content_bottom'): ?>
  </div>
<?php endif; ?>