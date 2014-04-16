<?php echo $header; ?>
<link rel="stylesheet" type="text/css" href="/admin/view/stylesheet/teil/basic/style.css" />
<link rel="stylesheet" type="text/css" href="/admin/view/stylesheet/teil/basic/loading-btn.css" />

<style type="text/css">
	@font-face {
	    font-weight: normal;
	    font-style: normal;
	    font-family: 'icomoon';
	    src:url('http://tympanus.net/Development/ProgressButtonStyles/fonts/icomoon/icomoon.eot');
	    src:url('http://tympanus.net/Development/ProgressButtonStyles/fonts/icomoon/icomoon.eot?#iefix') format('embedded-opentype'),
	        url('http://tympanus.net/Development/ProgressButtonStyles/fonts/icomoon/icomoon.ttf') format('truetype'),
	        url('http://tympanus.net/Development/ProgressButtonStyles/fonts/icomoon/icomoon.woff') format('woff'),
	        url('http://tympanus.net/Development/ProgressButtonStyles/fonts/icomoon/icomoon.svg#icomoon') format('svg');
	}
</style>

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
		    
		    <button class="progress-button" data-style="shrink" data-horizontal>Submit</button>

		</div><!-- end .content -->

    </div><!-- end .box -->
</div><!-- end #content -->

<script src="/admin/view/javascript/teil/basic/modernizr.custom.js"></script>
<script src="/admin/view/javascript/teil/basic/classie.js"></script>
<script src="/admin/view/javascript/teil/basic/loading-btn.js"></script>

<script type="text/javascript">

	var progressTimeoutId = 0;
	window.downloadComplete = false;
	window.prevProgress = 0;

	function getDownloadProgress() {
	    $.ajax({
			url: '/admin/index.php?route=teil/home/getProgress&token=<?php echo $token ?>',
			type: 'post',
			dataType: 'json',
			data: {
				module_name: "Menu"
			},
		})
		.done(function() {
			console.log("success");
		})
		.fail(function() {
			console.log("error");
		})
		.always(function(progress) {
			if (window.prevProgress <= progress)
			{
				window.prevProgress = progress;
			}

			if (window.prevProgress > progress) {
				progress = window.prevProgress;
			};

			window.instance13._setProgress(Number(progress) / 100);

			clearTimeout(progressTimeoutId);

			if ( ! window.downloadComplete)
			{
	        	progressTimeoutId = setTimeout(getDownloadProgress, 500);
			}
			else
			{
				window.instance13._setProgress(100);
			};
		});
	}

	[].slice.call( document.querySelectorAll( 'button.progress-button' ) ).forEach( function( bttn ) {
		new ProgressButton( bttn, {
			callback : function( instance13 ) {
				window.instance13 = instance13;

				// Load module
				$.ajax({
					url: '/admin/index.php?route=teil/home/install&token=<?php echo $token ?>',
					type: 'post',
					dataType: 'json',
					data: {
						module_path: "http://pimi.website-builder.ru/Menu.zip",
						module_name: "Menu"
					},
				})
				.done(function() {
					console.log("success");
				})
				.fail(function() {
					console.log("error");
				})
				.always(function() {
					clearTimeout(progressTimeoutId);

					window.downloadComplete = true;
					window.instance13._setProgress(100);
					window.instance13._stop(1);
				});

				getDownloadProgress(window.instance13);
			}
		} );
	} );
</script>

<?php echo $footer; ?>