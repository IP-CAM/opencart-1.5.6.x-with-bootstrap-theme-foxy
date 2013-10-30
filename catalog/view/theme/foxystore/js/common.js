$(document).ready(function () {
	// Create header carousel
	$("#header-carousel").carouFredSel({
		width 		: 1170,
		scroll		: 1,
		auto		: true,
		responsive  : true,
		items       : {
			visible : 1,
			width   : 1170,
			height  : "46%"
		},
		prev		: {	
			button	: "#header-slider-prev"
		},
		next		: { 
			button	: "#header-slider-next"
		},
		swipe		: {
			onTouch	: true,
			onMouse	: true
		}
	});


	// Open quick view popup
	window.bindQuickView = function (e) {
		var content = $(this).parent().parent().find('.quick-product-info');

		$.fancybox.open({
			content    : content,
			type	   : 'ajax',
			padding    : 30,
			width      : 870,
			autoHeight : true,
			autoSize   : false,
			fitToView  : true
		});

		// Create carousel (".quick-prouct-image-lg-id")
		createQuickViewCarousel(content.find('.quick-prouct-image-lg-id'));

		e.preventDefault();
	};

	$('.quick-view-btn').on('click', bindQuickView);

	// Quick product slider
	var createQuickViewCarousel = function (selector) {
		$(selector).carouFredSel({
			items       : {
				visible : 1,
				width   : 300,
				height  : 300
			},
			auto		  : true,
			swipe		  : {
				onTouch	  : true,
				onMouse	  : true
			},
			height: 300,
			width: 300,
			prev: {
				button: function() {
					return $(this).parent().siblings(".quick-prouct-image-lg-prev");
				}
			},
			next: {
				button: function() {
					return $(this).parent().siblings(".quick-prouct-image-lg-next");
				}
			}
		});
	};

	// Product image slider
	var productIageThumbsHtml = $('#product-images-thumbs').html();

	$("#prouct-image-lg").carouFredSel({
		items		  : 1,
		auto		  : false,
		swipe		  : {
			onTouch	  : true,
			onMouse	  : true
		},
		scroll: {
			onBefore: function () {
				$('#product-images-thumbs').find('li').css({
					opacity: "0.6",
					borderColor: "f7f7f7"
				});
			}
		},
		pagination	  : {
			container : "#product-images-thumbs",
			anchorBuilder: function () {
				if ($('#product-images-thumbs > li').length)
				{
					return;
				}

				return productIageThumbsHtml;
			}
		}
	});

	// Product tabs
	$('#tabs').carouFredSel({
		circular: false,
		responsive: true, 
		items: 1,
		width: '100%',
		auto: false,
		swipe		  : {
			onTouch	  : true
		},
		pagination: {
			container: '#pager',
			anchorBuilder: function( nr ) {
				return '<a href="#">' + $(this).data('title') + '</a>';
			}
		}
	});

	// Search
	$('#header input[type=\'submit\'].btn').bind('click', function(e) {
		url = $('base').attr('href') + 'index.php?route=product/search';

		var search = $('#header input[name=\'search\']').val();

		if (search) {
			url += '&search=' + encodeURIComponent(search);
		}

		location = url;

		e.preventDefault();
	});

	
	var timer;
	
	$('#header input[name=\'search\']').bind('keyup', function(e) {
		var inputBtn = $('#header input[type=\'submit\'].btn'),
			inputValue = $('#header input[name=\'search\']').val(),
			tmp = Handlebars.compile($('#quick-search').html());

		clearTimeout(timer);

		timer = setTimeout(function () {
			if (inputValue != '')
			{
				inputBtn.addClass('loading');

				$.ajax({
					url: "/index.php?route=product/search/preview",
					data: {
						search: inputValue,
						limit: 5
					},
					dataType: 'json',
					success: function (resp) {
						var html = tmp(resp);

						inputBtn.removeClass('loading');
						$('.navbar form[role="search"] .search-popup').html(html).slideDown();
					},
					error: function (resp) {
						var html = tmp(resp);

						inputBtn.removeClass('loading');
						$('.navbar form[role="search"] .search-popup').html(html).slideDown();
					}
				});
			}
			else
			{
				$('.navbar form[role="search"] .search-popup').slideUp();
			}
		}, 500);

		if (e.keyCode == 13) {
			var url = $('base').attr('href') + 'index.php?route=product/search';

			var search = inputValue;

			if (search) {
				url += '&search=' + encodeURIComponent(search);
			}

			location = url;

			e.preventDefault();
		}
	});

	// Open sidebar categories submenu
	$('.nav.nav-sidebar > li > a > span').on('click', function (e) {
		var $this = $(this),
			item = $this.closest('li');

		if (item.children('ul').css('display') == 'none')
		{
			$this.html("-").addClass('active');
		}
		else
		{
			$this.html("+").removeClass('active');
		}

		item.children('ul').slideToggle();

		e.preventDefault();
	});

	// Open review tab
	$('#write-new-review').on('click', function (e) {
		$('html, body').animate({
			scrollTop: $("#pager").offset().top
		}, function () {
			$('#pager > a:last').trigger('click');
		});

		e.preventDefault();
	});

	// Style form radio btn
	$('input[type=radio]').on('change', function () {
		var $this = $(this),
			name = $this.attr('name'),
			form  = $this.closest('form');

		form.find('input[name="' + name + '"]').parent().removeClass('checked');
		form.find('input[name="' + name + '"]:checked').parent().addClass('checked');
		console.log(form.find('input[name="' + name + '"]:checked'));
	});


	// Style form checkboxes
	$('input[type=checkbox]').on('change', function () {
		$(this).parent().toggleClass('checked');
	});

	// Set datetime picker
	var updateDateTimeInput = function () {
		$(this).siblings('.add-on').children('i').click();
	};

	$('#datetimepicker').datetimepicker()
	.find('input').on('focus', updateDateTimeInput);

	$('#timepicker').datetimepicker({
		pickDate: false
	}).find('input').on('focus', updateDateTimeInput);

	$('#datepicker').datetimepicker({
		pickTime: false
	}).find('input').on('focus', updateDateTimeInput);

	window.bindInputTypeNumber = function () {
		// Emulate input type number
		$('.input-type-number a').off().on('click', function (e) {
			var $this = $(this),
				input = $this.siblings('input'),
				newVal = parseInt(input.val()) + parseInt($this.data('num'));

			// If new val is greater then 1
			if (newVal)
			{
				input.val(parseInt(newVal));
			}

			e.preventDefault();
		});

		// Input type number validation
		$('.input-type-number input').off().on('change', validateInputTypeNumber);
		$('.input-type-number a').on('click', validateInputTypeNumber);
	};

	bindInputTypeNumber();

	// Change main product image
	$('.product-images > li > a').on('click', function (e) {
		$('#prouct-image-lg img').attr({
			src: $(this).data('image')
		});

		e.preventDefault();
	});

	// Style selects
	$('select').selectpicker();

	window.bindRemovableLinks = function () {
		// Remove product from mini ajax cart
		$('.cart-popup a.close, table.cart tr td.count .close-holder .close').on('click', function (e) {
			var $this = $(this),
				productKey = $this.data('product-key');

			removeFromCart(productKey);

			$this.closest('tr').fadeOut();

			e.preventDefault();
		});
	};

	window.bindRemovableLinks();
	

	window.bindActionBtns = function () {
		// Add active class to rounded btn
		$(".catalog .rounded-icon, .action-button").off().on('click', function (e) {
			var $this = $(this),
				productId = $this.data('product-id');

			// Wishlist
			if ($this.hasClass('fav'))
			{
				if ($this.hasClass('active'))
				{
					removeFromWishList(productId);
				}
				else
				{
					addToWishList(productId);
				}


				// Toggle active class
				$('.product-preview-block-' + productId + ', ' + '.product-preview-block-popup-' + productId)
					.find('.fav')
					.toggleClass('active');
			}
			// Compare
			else if ($this.hasClass('compare'))
			{
				if ($this.hasClass('active'))
				{
					removeFromCompare(productId);
				}
				else
				{
					addToCompare(productId);
				}

				// Toggle active class
				$('.product-preview-block-' + productId + ', ' + '.product-preview-block-popup-' + productId)
					.find('.compare')
					.toggleClass('active');
			}

			e.preventDefault();
		});
	};

	bindActionBtns();

	// Validate input type number
	var validateInputTypeNumber = function (e) {
		var $this = $(this),
			input = $this.parent().children('input'),
			min = input.attr('min');

		if (input.val() < min)
		{
			input.val(min);
		}

		if (e !== undefined && e)
		{
			e.preventDefault();
		}
	};

	// Eascape string helper
	Handlebars.registerHelper('escape', function(text) {
		return new Handlebars.SafeString(text);
	});

	// Sprintf implementation for product discount
	Handlebars.registerHelper('product_discount', function(text, quantity, price) {
		return sprintf(text, quantity, price);
	});

	// Check if product is in compare/wish list
	Handlebars.registerHelper('in_list', function(productId, listType, btnText, options) {
		var inList = false,
			list;

		// Set list to search for
		if (listType == 'compare')
		{
			list = window.products.compare_list;
		}
		else
		{
			list = window.products.wish_list;
		}

		// Search for productId
		if (list)
		{
			$.each(list, function (index, obj) {
				if (productId == obj)
				{
					inList = true;
				}
			});
		}

		if (inList)
		{
			if (listType == 'compare')
			{
				return "<a href='#' data-product-id='" + productId + "' class='compare active action-button btn btn-grey col-xs-12 col-sm-5'><span class='glyphicon glyphicon-stats'></span><span>" + btnText + "</span></a>";
			}
			else
			{
				return "<a href='#' data-product-id='" + productId + "' class='fav active action-button btn btn-grey col-xs-12 col-sm-5'><span class='glyphicon glyphicon-heart'></span><span>" + btnText + "</span></a>";
			}
		}
		else
		{
			if (listType == 'compare')
			{
				return "<a href='#' data-product-id='" + productId + "' class='compare action-button btn btn-grey col-xs-12 col-sm-5'><span class='glyphicon glyphicon-stats'></span><span>" + btnText + "</span></a>";
			}
			else
			{
				return "<a href='#' data-product-id='" + productId + "' class='fav action-button btn btn-grey col-xs-12 col-sm-5'><span class='glyphicon glyphicon-heart'></span><span>" + btnText + "</span></a>";
			}
		}
	});

	// Switch to grid/list view
	$('#catalog-grid-view, #catalog-list-view').on('click', function (e) {
		var $this = $(this),
			_appendListView = function () {
				var tmp = Handlebars.compile($('#product-list-view').html()),
					phtml = tmp(window.products);

				// Append template
				$('#products-grid-container').hide().after(phtml);

				// Rebind events
				init();
			};

		$this.siblings('a').removeClass('active').end().addClass('active');

		// Switch to grid view
		if ($this.attr('id') == 'catalog-grid-view')
		{
			// If there is a grid view ---> abort
			if ($('#products-grid-container').css('display') == 'block')
			{
				return false;
			}

			$('#products-list-container').hide();
			$('#products-grid-container').show();
		}
		// Switch to list view
		if ($this.attr('id') == 'catalog-list-view')
		{
			// If there is a list view ---> abort
			if ($('#products-list-container').css('display') == 'block')
			{
				return false;
			}

			_appendListView();
		}

		e.preventDefault();
	});

	// Automaticly change to grid view, if .col-xs
	$(window).on('resize', function () {
		if ($(this).width() <= 768)
		{
			$('#catalog-list-view').removeClass('active');
			$('#catalog-grid-view').addClass('active');
			$('#products-list-container').hide();
			$('#products-grid-container').show();
		}
	});

	// Init dl-menu
	$( '#dl-menu' ).dlmenu();

	// Add tooltops
	$('.tooltiped').tooltip();

	window.bindMiniCart = function () {
		// Show mini-basket on hover
		var miniCartTimer;
		
		$(".mini-cart > .btn").mouseenter(function () {
			clearTimeout(miniCartTimer);

			$('.mini-cart-popup').show();
		});

		$(".mini-cart > .btn").mouseleave(function() {
			miniCartTimer = setTimeout(function () {
				$('.mini-cart-popup').hide();
			}, 600);
		});

		$('.mini-cart-popup').mouseenter(function () {
			clearTimeout(miniCartTimer);
		});

		$('.mini-cart-popup').mouseleave(function () {
			miniCartTimer = setTimeout(function () {
				$('.mini-cart-popup').hide();
			}, 600);
		});
	};

	window.bindMiniCart();

	// Increase width of the search input
	$('.navbar form .search').on('focus', function () {
		$(this).animate({
			width: 250
		}, 200, function () {
			var popup = $('.search-popup');

			if (popup.find('ul').length)
			{
				popup.slideDown();
			}
		});
	});

	$('.navbar form .search').on('blur', function () {
		var $this = $(this);

		$('.search-popup').slideUp(function () {
			$this.animate({
				width: 193
			}, 200);
		});
	});

	window.init = function () {
		$('.quick-view-btn').off().on('click', bindQuickView);
		bindActionBtns();
		bindInputTypeNumber();
	};
});