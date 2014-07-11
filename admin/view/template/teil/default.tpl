<?php echo $header; ?>

<!-- Styles -->
<link rel="stylesheet" type="text/css" href="/admin/view/stylesheet/teil/modules-list.css">

<!-- Mignify popup -->
<link rel="stylesheet" href="/admin/view/javascript/teil/bower_components/magnific-popup/dist/magnific-popup.css">

<!-- Token -->
<input type="hidden" value="<?php echo $token ?>" id="token">


<!-- Entry application -->
<div ng-app="teil">
	<div ng-controller="CommonController" id="content">

		<h3 class="__h2">Discover our great modules</h3>
		<div class="info__small">A huge range of learning resources across 10 creative topics, all in one convenient place.</div>

		<ul class="modules__list">
			<module-thumb ng-repeat="module in modules"></module-thumb>
		</ul><!-- end ,.modules__list -->

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
<script src="/admin/view/javascript/teil/directives/module-thumb.js"></script>
<script src="/admin/view/javascript/teil/directives/btn-progress.js"></script>

<!-- Services -->
<script src="/admin/view/javascript/teil/services/module-downloader.js"></script>


<?php echo $footer; ?>