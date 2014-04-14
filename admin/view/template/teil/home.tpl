<?php echo $header; ?>
<link rel="stylesheet" type="text/css" href="/admin/view/stylesheet/teil/basic/style.css" />
<link rel="stylesheet" type="text/css" href="/admin/view/stylesheet/teil/basic/loading-btn.css" />

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
	[].slice.call( document.querySelectorAll( 'button.progress-button' ) ).forEach( function( bttn ) {
		new ProgressButton( bttn, {
			callback : function( instance ) {
				var progress = 0,
					interval = setInterval( function() {
						progress = Math.min( progress + Math.random() * 0.1, 1 );
						instance._setProgress( progress );

						if( progress === 1 ) {
							instance._stop(1);
							clearInterval( interval );
						}
					}, 200 );
			}
		} );
	} );
</script>

<?php echo $footer; ?>