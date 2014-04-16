<?php echo $header; ?>
<link rel="stylesheet" type="text/css" href="/admin/view/stylesheet/teil/basic/style.css" />
<link rel="stylesheet" type="text/css" href="/admin/view/stylesheet/teil/basic/make-buttons.css" />
<link rel="stylesheet" type="text/css" href="/admin/view/stylesheet/teil/basic/app-list.css" />

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
		    <h2>Hello, world</h2>

		    <div id="apps-container">
		    	<ol class="app-list"></ol>
		    </div>

		</div><!-- end .content -->

    </div><!-- end .box -->
</div><!-- end #content -->

<script src="/admin/view/javascript/teil/basic/modernizr.custom.js"></script>
<script src="/admin/view/javascript/teil/libs/handlebars/handlebars-v1.3.0.js"></script>

<script src="/admin/view/javascript/teil/basic/module-downloader.js"></script>
<script src="/admin/view/javascript/teil/basic/apps-catalog.js"></script>

<script type="template/x-handlebars" id="app-template">
	{{#each apps}}
		<li>
			<figure>
				<img class="main-app-image" src="{{image}}">

				<figcaption>
					<span class="app-title">{{title}}</span>
					<span class="app-category">{{category}}</span>
					<span class="app-updated-at">{{updated_at}}</span>

					<a 
						class="point-make-button download-app-action" 
						data-module-name="{{download_name}}" 
						data-module-download-path="{{download_path}}" 
						href="#" 
					>Buy app for {{price}}</a>
				</figcaption>
			</figure>
		</li>
	{{/each}}
</script>

<script type="text/javascript">
	var Apps = new AppCatalog('<?php echo $token ?>');
	Apps.init();
</script>

<?php echo $footer; ?>