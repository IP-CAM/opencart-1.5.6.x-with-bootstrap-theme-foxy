<?php echo $header; ?>

<!-- Styles -->
<link rel="stylesheet" type="text/css" href="/admin/view/stylesheet/teil/modules-list.css">

<!-- Mignify popup -->
<link rel="stylesheet" href="/admin/view/javascript/teil/bower_components/magnific-popup/dist/magnific-popup.css">


<div ng-app="teil">
	<div ng-controller="CommonController" id="content">

		<h3 class="__h2">Discover our great modules</h3>
			<div class="info__small">A huge range of learning resources across 10 creative topics, all in one convenient place.</div>

			<ul class="modules__list">
				<li class="modules__item" ng-repeat="module in modules">
					<div class="modules__item-thumbnail">
						<img class="modules__item-thumbnail-image" ng-src="{{ module.image }}">
					</div>

					<div class="modules__item-info">
						<div class="modules__topic topic-code">{{ module.category }}</div>
						<h3 class="modules__title nolinks">{{ module.title }}</h3>
						<time class="modules__publication-date" datetime="{{ module.updated_at }}" title="18 Apr 2013">18 Apr 2013</time>

						<button class="btn__blue btn__block" data-module-code="{{ module.code }}">Preview</button>

						<module-min-price module="module"></module-min-price>
					</div>
					
					<a class="modules__item-link" href="javascript:;" ng-click="openPopup(module)"></a>
				</li>
			</ul>

	</div><!-- end #content -->
</div><!-- end NG-APP -->

<!-- Mignific popup -->
<script src="/admin/view/javascript/teil/bower_components/magnific-popup/dist/jquery.magnific-popup.min.js"></script>

<!-- Angular core -->
<script src="/admin/view/javascript/teil/bower_components/angular/angular.js"></script>
<script src="/admin/view/javascript/teil/bower_components/angular-route/angular-route.min.js"></script>

<!-- Init -->
<script src="/admin/view/javascript/teil/init.js"></script>

<!-- Controllers -->
<script src="/admin/view/javascript/teil/controllers/CommonController.js"></script>

<!-- Directives -->
<script src="/admin/view/javascript/teil/directives/module-min-price.js"></script>
<script src="/admin/view/javascript/teil/directives/module-popup.js"></script>



<?php echo $footer; ?>