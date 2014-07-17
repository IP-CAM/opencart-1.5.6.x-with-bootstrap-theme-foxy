<?php echo $header; ?>
<link rel="stylesheet" type="text/css" href="/admin/view/stylesheet/teil/basic/style.css" />
<link rel="stylesheet" type="text/css" href="/admin/view/stylesheet/teil/basic/make-buttons.css" />
<link rel="stylesheet" type="text/css" href="/admin/view/stylesheet/teil/basic/app-list.css" />

<?php // Menu::test(); ?>

<div id="content">
    <div class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
        <?php } ?>
    </div>
    <div class="box">
		<div class="heading">
		    <h1><img src="view/image/category.png" alt=""> Teil</h1>
		    <div class="buttons">
	            <a class="button" href="#">Action</a>
		    </div>
		</div><!-- end .heading -->
		
		<div class="content teil-container">
		    <div id="apps-container">
		    	<h2>Already installed apps:</h2>
		    	<ol class="app-list app-list-installed"></ol>

		    	<h2>Discover more:</h2>
		    	<ol class="app-list app-list-not-installed"></ol>
		    </div>
		</div><!-- end .content -->

    </div><!-- end .box -->
</div><!-- end #content -->

<script src="/admin/view/javascript/teil/basic/modernizr.custom.js"></script>
<script src="/admin/view/javascript/teil/libs/handlebars/handlebars-v1.3.0.js"></script>


<!-- hey -->
<script src="/admin/view/javascript/teil/basic/module-downloader.js"></script>
<script src="/admin/view/javascript/teil/basic/apps-catalog.js"></script>


<!-- Template for not installed apps -->
<script type="template/x-handlebars" id="app-template-not-installed">
	{{#each apps}}
		<li>
			<figure>
				<img class="main-app-image" src="{{image}}">

				<figcaption>
					<span class="app-title">
						{{#if is_installed}}+{{/if}}

						{{title}}
					</span>
					<span class="app-category">{{category}}</span>
					<span class="app-updated-at">
						{{updated_at}}
						
						{{#if days_left}}
							<div>{{days_left}} days left</div>
							<div>Expired at {{expired_at}}</div>
						{{/if}}
					</span>

					{{#unless is_installed}}
						<a 
							class="point-make-button download-app-action" 
							data-module-name="{{code}}" 
							href="#" 
						>

						{{#if days_left}}
							Download
						{{else}}
							Get app for {{price}}
						{{/if}}

						</a>

					{{/unless}}
				</figcaption>
			</figure>
		</li>
	{{/each}}
</script>


<!-- Template for installed apps -->
<script type="template/x-handlebars" id="app-template-installed">
	{{#each apps}}
		<li>
			<figure>
				<img class="main-app-image" src="{{image}}">

				<figcaption>
					<span class="app-title">{{title}}</span>
					<span class="app-category">{{category}}</span>
					<span class="app-updated-at">
						{{updated_at}}

						{{#if days_left}}
							<div>{{days_left}} days left</div>
							<div>Expired at {{expired_at}}</div>
						{{/if}}
					</span>

					<a 
						class="point-make-button remove-app-action" 
						data-module-name="{{code}}" 
						href="#" 
					>Remove app</a>
				</figcaption>
			</figure>
		</li>
	{{/each}}
</script>


<!-- Template for just installed app (single) -->
<script type="template/x-handlebars" id="app-template-installed-single">
	<li class="app-hidden">
		<figure>
			<img class="main-app-image" src="{{image}}">

			<figcaption>
				<span class="app-title">{{title}}</span>
				<span class="app-category">{{category}}</span>
				<span class="app-updated-at">{{updated_at}}</span>

				<a 
					class="point-make-button remove-app-action" 
					data-module-name="{{code}}" 
					href="#" 
				>Remove app</a>
			</figcaption>
		</figure>
	</li>
</script>


<script type="text/javascript">
	var appsCatalog = new AppCatalog('<?php echo $token ?>');
	appsCatalog.init();
</script>


<?php echo $footer; ?>