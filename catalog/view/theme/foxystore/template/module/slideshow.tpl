<div class="demo-2">
  <div id="slider" class="sl-slider-wrapper">

  <div class="sl-slider">

    <?php foreach ($banners as $banner) { ?>
      <?php if ($banner['link']) { ?>
        <div class="sl-slide" data-orientation="horizontal" data-slice1-rotation="-25" data-slice2-rotation="-25" data-slice1-scale="2" data-slice2-scale="2">
          <div class="sl-slide-inner">
            <div class="bg-img" style="background-image: url(<?php echo $banner['image']; ?>);"></div>
            <h2><?php echo htmlspecialchars_decode($banner['title']); ?></h2>
          </div>
        </div>
      <?php } else { ?>
        <div class="sl-slide" data-orientation="vertical" data-slice1-rotation="10" data-slice2-rotation="-15" data-slice1-scale="1.5" data-slice2-scale="1.5">
          <div class="sl-slide-inner">
            <div class="bg-img" style="background-image: url(<?php echo $banner['image']; ?>);"></div>
            <h2><?php echo htmlspecialchars_decode($banner['title']); ?></h2>
          </div>
        </div>
      <?php } ?>
    <?php } ?>

  </div><!-- /sl-slider -->

  <nav id="nav-dots" class="nav-dots">
    <?php foreach ($banners as $key => $banner) { ?>
      <?php if ( ! $key): ?>
        <span class="nav-dot-current"></span>
      <?php else: ?>
        <span></span>
      <?php endif ?>
    <?php } ?>
  </nav>

  </div><!-- /slider-wrapper -->
</div>

<script type="text/javascript"> 
  $(document).ready(function() {
  
    var Page = (function() {

      var $nav = $( '#nav-dots > span' ),
        slitslider = $( '#slider' ).slitslider( {
          onBeforeChange : function( slide, pos ) {

            $nav.removeClass( 'nav-dot-current' );
            $nav.eq( pos ).addClass( 'nav-dot-current' );

          }
        } ),

        init = function() {

          initEvents();
          
        },
        initEvents = function() {

          $nav.each( function( i ) {
          
            $( this ).on( 'click', function( event ) {
              
              var $dot = $( this );
              
              if( !slitslider.isActive() ) {

                $nav.removeClass( 'nav-dot-current' );
                $dot.addClass( 'nav-dot-current' );
              
              }
              
              slitslider.jump( i + 1 );
              return false;
            
            } );
            
          } );

        };

        return { init : init };

    })();

    Page.init();
  });
</script>