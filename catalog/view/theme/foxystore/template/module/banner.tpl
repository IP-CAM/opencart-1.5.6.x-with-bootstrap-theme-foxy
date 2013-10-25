<?php if ($position == 'content_top' || $position == 'content_bottom'): ?>
<div class="container">
  <div class="row">
    <div class="col-md-12">
<?php endif; ?>

  <div id="banners">
    <?php foreach ($banners as $banner) { ?>
    <?php if ($banner['link']) { ?>
    <div><a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" /></a></div>
    <?php } else { ?>
    <div><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" /></div>
    <?php } ?>
    <?php } ?>
  </div>

<?php if ($position == 'content_top' || $position == 'content_bottom'): ?>
    </div>
  </div>
</div>
<?php endif; ?>

<script type="text/javascript"><!--
$(document).ready(function() {
  $("#banners").carouFredSel({
    width     : 260,
    height    : 350,
    scroll    : {
      fx: "crossfade"
    },
    auto      : true,
    items     : {
      visible : 1,
      width   : 260,
      height  : 350
    }
  });
});

//--></script>