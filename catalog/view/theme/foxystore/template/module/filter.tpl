<h4 class="sidebar-heading"><?php echo $heading_title; ?></h4>
<div class="sidebar-block oH">
	<form>
		<?php foreach ($filter_groups as $filter_group) { ?>
			<h5 id="filter-group<?php echo $filter_group['filter_group_id']; ?>"><?php echo $filter_group['name']; ?></h5>

			<?php foreach ($filter_group['filter'] as $filter) { ?>
				<?php if (in_array($filter['filter_id'], $filter_category)) { ?>
					<div class="checkbox">
						<label class="checked" for="filter<?php echo $filter['filter_id']; ?>"><?php echo $filter['name']; ?>
							<input value="<?php echo $filter['filter_id']; ?>" id="filter<?php echo $filter['filter_id']; ?>" checked="checked" type="checkbox">
						</label>
					</div>
				<?php } else { ?>
					<div class="checkbox">
						<label for="filter<?php echo $filter['filter_id']; ?>"><?php echo $filter['name']; ?>
							<input value="<?php echo $filter['filter_id']; ?>" id="filter<?php echo $filter['filter_id']; ?>" type="checkbox">
						</label>
					</div>
				<?php } ?>
			<?php } ?>
		<?php } ?>

		<div class="checkbox">
			<a href="#" id="button-filter" class="btn btn-basket"><?php echo $button_filter; ?></a>
		</div>
	</form>
</div>

<script type="text/javascript"><!--
$('#button-filter').on('click', function(e) {
	filter = [];
	
	$('.sidebar-block input[type=\'checkbox\']:checked').each(function(element) {
		filter.push(this.value);
	});
	
	location = '<?php echo $action; ?>&filter=' + filter.join(',');

	e.preventDefault();
});
//--></script> 