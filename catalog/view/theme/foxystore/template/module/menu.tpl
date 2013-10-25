<?php if ($position == 'content_top' || $position == 'content_bottom'): ?>
<div class="container">
	<div class="row">
		<div class="col-md-12">
<?php endif; ?>

<div class="menu">
	<h4 class="sidebar-heading"><?php Menu::getMenuName($menu_code); ?></h4>
	<?php Menu::call($menu_code)?>
</div>

<?php if ($position == 'content_top' || $position == 'content_bottom'): ?>
		</div>
	</div>
</div>
<?php endif; ?>