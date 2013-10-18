<h4 class="sidebar-heading"><?php echo $heading_title; ?></h4>

<ul class="nav nav-stacked nav-sidebar sidebar-block">
	<?php foreach ($categories as $category) { ?>
		<?php if ($category['category_id'] == $category_id) { ?>
			<li class="active">
				<a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?>
					<?php if ($category['children']): ?>
						<span>-</span>
					<?php endif ?>
				</a>
		<?php } else { ?>
			<li>
				<a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?>
					<?php if ($category['children']): ?>
						<span>+</span>
					<?php endif ?>
				</a>
		<?php } ?>

			<?php if ($category['children']) { ?>
			<ul>
				<?php foreach ($category['children'] as $child) { ?>
				<li>
					<?php if ($child['category_id'] == $child_id) { ?>
						<a href="<?php echo $child['href']; ?>" class="active"> - <?php echo $child['name']; ?></a>
					<?php } else { ?>
						<a href="<?php echo $child['href']; ?>"> - <?php echo $child['name']; ?></a>
					<?php } ?>
				</li>
				<?php } ?>
			</ul>
			<?php } ?>
		</li>
	<?php } ?>
</ul>