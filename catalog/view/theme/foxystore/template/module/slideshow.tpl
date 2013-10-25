<!-- Slider -->
<div id="slider" class="hidden-xs">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<ul id="header-carousel">
					<?php foreach ($banners as $banner) { ?>
						<?php if ($banner['link']) { ?>
							<li><img src="<?php echo $banner['image']; ?>" title="<?php echo $banner['title']; ?>" alt="<?php echo $banner['title']; ?>"></li>
						<?php } else { ?>
							<li><img src="<?php echo $banner['image']; ?>" title="<?php echo $banner['title']; ?>" alt="<?php echo $banner['title']; ?>"></li>
						<?php } ?>
					<?php } ?>
				</ul><!-- end #header-carousel -->
			</div>
		</div>
	</div><!-- end .container -->

	<a href="#" class="arrow" id="header-slider-next"></a>
	<a href="#" class="arrow" id="header-slider-prev"></a>
</div><!-- end #slider -->