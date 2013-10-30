var addToCart, addToWishList, addToCompare;

$(document).ready(function () {

	addToCart = function (product_id, quantity) {
		quantity = typeof(quantity) != 'undefined' ? quantity : 1;

		$.ajax({
			url: 'index.php?route=checkout/cart/add',
			type: 'post',
			data: 'product_id=' + product_id + '&quantity=' + quantity,
			dataType: 'json',
			success: function(json) {
				if (json['redirect']) {
					location = json['redirect'];
				}
				
				if (json['success']) {
					$.pnotify.defaults.delay = 1500;

					$.pnotify({
						text: json['success'],
						cornerclass: 'ui-pnotify-sharp',
						shadow: false,
						type: 'success'
					});

					$('#header-mini-cart').load('index.php?route=module/cart', function () {
						window.bindMiniCart();
						window.bindRemovableLinks();
					});
				}
			}
		});
	};

	removeFromCart = function (product_key) {
		$.ajax({
			url: 'index.php?route=checkout/cart/remove',
			type: 'post',
			data: 'product_key=' + product_key,
			dataType: 'json',
			success: function(json) {
				if (json['redirect']) {
					location = json['redirect'];
				}

				$('#header-mini-cart .text-items').load('index.php?route=module/cart .text-items');
				
				$('#header-mini-cart .mini-cart-popup').load('index.php?route=module/cart .mini-cart-popup-inner', function () {
					window.bindMiniCart();
					window.bindRemovableLinks();
				});
			}
		});
	};
	
	addToWishList = function (product_id) {
		$.ajax({
			url: 'index.php?route=account/wishlist/add',
			type: 'post',
			data: 'product_id=' + product_id,
			dataType: 'json',
			success: function(json) {
				if (json['redirect']) {
					location = json['redirect'];
				}

				if (window.products !== undefined)
				{
					// Add to local var
					var count = 0,
						curCount = 0,
						curIndex = 0;

					// Get total size
					$.each(products.wish_list, function (index, obj) { count++; });

					// Get last index
					$.each(products.wish_list, function (index, obj) {
						if (++curCount >= count)
						{
							curIndex = index;
						}
					});

					// Add new product_id to list
					products.wish_list[++curIndex] = product_id;
				}
			}
		});
	};

	removeFromWishList = function (product_id) {
		$.ajax({
			url: 'index.php?route=account/wishlist/remove',
			type: 'post',
			data: 'product_id=' + product_id,
			dataType: 'json',
			success: function(json) {
				if (json['redirect']) {
					location = json['redirect'];
				}

				if (window.products !== undefined)
				{
					// Remove product_if from list
					$.each(products.wish_list, function (index, obj) {
						if (product_id == obj)
						{
							delete products.wish_list[index];
						}
					});
				}
			}
		});
	}

	addToCompare = function (product_id) { 
		$.ajax({
			url: 'index.php?route=product/compare/add',
			type: 'post',
			data: 'product_id=' + product_id,
			dataType: 'json',
			success: function(json) {
				if (json['redirect']) {
					location = json['redirect'];
				}

				if (window.products !== undefined)
				{
					// Add to local var
					var count = 0,
						curCount = 0,
						curIndex = 0;

					// Get total size
					$.each(products.compare_list, function (index, obj) { count++; });

					// Get last index
					$.each(products.compare_list, function (index, obj) {
						if (++curCount >= count)
						{
							curIndex = index;
						}
					});

					// Add new product_id to list
					products.compare_list[++curIndex] = product_id;
				}
			}
		});
	};

	removeFromCompare = function (product_id) { 
		$.ajax({
			url: 'index.php?route=product/compare/remove',
			type: 'post',
			data: 'product_id=' + product_id,
			dataType: 'json',
			success: function(json) {
				if (json['redirect']) {
					location = json['redirect'];
				}

				if (window.products !== undefined)
				{
					// Remove product_if from list
					$.each(products.compare_list, function (index, obj) {
						if (product_id == obj)
						{
							delete products.compare_list[index];
						}
					});
				}
			}
		});
	};

});