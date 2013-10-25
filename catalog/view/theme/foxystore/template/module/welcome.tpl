<?php if ($position == 'content_top' || $position == 'content_bottom'): ?>
<div class="container">
	<div class="row">
		<div class="col-md-12">
<?php endif; ?>

<h4 class="sidebar-heading">
	<?php echo $heading_title; ?>
</h4>

<div class="sidebar-block oH">
	<?php echo $message; ?>
</div>

<?php if ($position == 'content_top' || $position == 'content_bottom'): ?>
		</div>
	</div>
</div>
<?php endif; ?>