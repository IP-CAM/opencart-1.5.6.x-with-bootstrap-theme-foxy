<?php if ($position == 'content_top' || $position == 'content_bottom'): ?>
<div class="container">
	<div class="row">
		<div class="col-md-12">
<?php endif; ?>

<h4 class="sidebar-heading">
  <?php echo $heading_title; ?>
</h4>

<ul class="nav nav-stacked nav-sidebar sidebar-block">
  <?php foreach ($stores as $store) { ?>
    <?php if ($store['store_id'] == $store_id) { ?>
      <li class="active"><a href="<?php echo $store['url']; ?>"><?php echo $store['name']; ?></a></li>
    <?php } else { ?>
      <li><a href="<?php echo $store['url']; ?>"><?php echo $store['name']; ?></a></li>
    <?php } ?>
  <?php } ?>
</ul>

<?php if ($position == 'content_top' || $position == 'content_bottom'): ?>
		</div>
	</div>
</div>
<?php endif; ?>