<?php if ($position == 'content_top' || $position == 'content_bottom'): ?>
<div class="container">
	<div class="row">
		<div class="col-md-12">
<?php endif; ?>

<?php echo $message; ?>

<?php if ($position == 'content_top' || $position == 'content_bottom'): ?>
		</div>
	</div>
</div>
<?php endif; ?>