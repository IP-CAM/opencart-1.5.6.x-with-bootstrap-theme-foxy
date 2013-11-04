	<!-- Pre footer -->
	<div class="pre-footer">
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<h3>CONTACT US</h3><hr class="short">
					<ul class="list-unstyled oH">
						<li>
							<span class="footer-icon phone"></span>
							<span>1234 567 8901</span>
						</li>
						<li>
							<span class="footer-icon phone"></span>
							<span>4321 765 1098</span>
						</li>
						<li>
							<span class="footer-icon mail"></span>
							<a href="mailto:info@foxystore.com">info@foxystore.com</a>
						</li>
						<li>
							<span class="footer-icon skype"></span>
							<a href="skype:foxystore">foxystore</a>
						</li>
						<li>
							<span class="footer-icon location"></span>
							<span>Fox Avenue San Francisco,<br>
							CA 90024. USA </span>
						</li>
					</ul>
				</div>
				<div class="col-md-3">
					<h3>About theme</h3><hr class="short">
					<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>
				</div>
				<div class="col-md-3">
					<h3>FROM TWITTER</h3><hr class="short">
					<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>
				</div>
				<div class="col-md-3">
					<h3>FACEBOOK</h3><hr class="short">
					<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>
				</div>
			</div>
		</div>
	</div><!-- end .pre-footer -->

	<!-- Footer -->
	<div class="container footer">
		<div class="row">
			<?php if ($informations) { ?>
				<div class="col-md-3 col-sm-6">
					<h3><?php echo $text_information; ?></h3><hr class="short">
					<ul class="list-unstyled oH">
						<?php foreach ($informations as $information) { ?>
							<li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
						<?php } ?>
					</ul>
				</div>
			<?php } ?>
			<div class="col-md-3 col-sm-6">
				<h3><?php echo $text_extra ?></h3><hr class="short">
				<ul class="list-unstyled oH">
					<li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
					<li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
					<li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
					<li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
				</ul>
			</div>
			<div class="col-md-3 col-sm-6">
				<h3><?php echo $text_account ?></h3><hr class="short">
				<ul class="list-unstyled oH">
					<li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
					<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
					<li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
					<li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
				</ul>
			</div>
			<div class="col-md-3 col-sm-6">
				<h3><?php echo $text_service ?></h3><hr class="short">
				<ul class="list-unstyled oH">
					<li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
					<li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
					<li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
				</ul>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<hr>
			</div>
		</div>

		<div class="row">
			<div class="col-md-6">
				© Copyright 2013. Powered by <a href="#" class="black-link">OpenCart</a>.<br>
				<a href="#">Foxystore</a> theme made by <a href="#">Teil.com.ua</a>
			</div>
			<div class="col-md-6">
			</div>
		</div>
	</div><!-- end .container -->

	<script src="/catalog/view/theme/foxystore/js/modernizr.custom.js"></script>
	<script src="/catalog/view/theme/foxystore/js/jquery.pnotify.min.js"></script>
	<script src="/catalog/view/theme/foxystore/js/jquery.ba-cond.min.js"></script>
	<script src="/catalog/view/theme/foxystore/js/handlebars.js"></script>
	<script src="/catalog/view/theme/foxystore/js/jquery.fancybox.pack.js"></script>
	<script src="/catalog/view/theme/foxystore/js/jquery.dlmenu.js"></script>
	<script src="/catalog/view/theme/foxystore/js/jquery.color.js"></script>
	<script src="/catalog/view/theme/foxystore/js/bootstrap.min.js"></script>
	<script src="/catalog/view/theme/foxystore/js/jquery.carouFredSel-6.2.1-packed.js"></script>
	<script src="/catalog/view/theme/foxystore/js/jquery.touchSwipe.min.js"></script>
	<script src="/catalog/view/theme/foxystore/js/jquery.select.js"></script>
	<script src="/catalog/view/theme/foxystore/js/bootstrap-datetimepicker.min.js"></script>
	<script src="/catalog/view/theme/foxystore/js/common.js"></script>
	<script src="/catalog/view/theme/foxystore/js/opencart.js"></script>

	<script type="template/x-handlebars" id="quick-search">
		{{#if products}}
			<ul class="featured">
				{{#each products}}
					<li>
						<img src="{{escape thumb}}">
						<a href="{{escape href}}">{{name}}</a>

						{{#if special}}
							<span class="price">
								{{special}}
								<span class="price-old">{{price}}</span>
							</span>
						{{else}}
							<span class="price">{{price}}</span>
						{{/if}}
					</li>
				{{/each}}
			</ul>

			<a href="{{escape all}}" class="static more">See all results</a>
		{{else}}
			<h5>{{error}}</h5>
		{{/if}}
	</script>

</body>

</html>