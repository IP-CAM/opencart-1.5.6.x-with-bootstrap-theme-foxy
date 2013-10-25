<?php if ($position == 'content_top' || $position == 'content_bottom'): ?>
<div class="container">
	<div class="row">
		<div class="col-md-12">
<?php endif; ?>

<h4 class="sidebar-heading">
  <?php echo $heading_title; ?>
</h4>

<ul class="nav nav-stacked nav-sidebar sidebar-block">
  <?php foreach ($informations as $information) { ?>
    <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
  <?php } ?>
  <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
  <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
</ul>

<?php if ($position == 'content_top' || $position == 'content_bottom'): ?>
		</div>
	</div>
</div>
<?php endif; ?>