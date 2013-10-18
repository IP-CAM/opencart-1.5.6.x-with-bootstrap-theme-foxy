<?php if ($reviews) { ?>
	<?php foreach ($reviews as $review) { ?>
		<div class="media">
			<a class="pull-left" href="#">
				<img class="media-object" src="/image/no_image.jpg">
			</a>
			<div class="media-body">
				<h4 class="media-heading pull-left w">
					<span><?php echo $review['author']; ?></span>
					<img src="/catalog/view/theme/foxystore/img/product-rating-<?php echo $review['rating']; ?>.png">
				</h4>
				<div class="date"><?php echo $review['date_added']; ?></div>
				<?php echo $review['text']; ?>
			</div>
		</div>
	<?php } ?>
	
	<div class="pagination"><?php echo $pagination; ?></div>
<?php } else { ?>
	<h4><?php echo $text_no_reviews; ?></h4>
<?php } ?>