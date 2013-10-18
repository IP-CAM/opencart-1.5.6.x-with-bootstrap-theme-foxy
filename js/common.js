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
	$('.quick-view-btn').on('click', function (e) {
		$.fancybox.open({
			content    : $('.quick-product-info'),
			type	   : 'ajax',
			padding    : 30,
			width      : 870,
			autoHeight : true,
			scrolling  : 'no',
			autoSize   : false,
			fitToView  : true
		});

		e.preventDefault();
	});

	// Quick product slider
	$("#quick-prouct-image-lg").carouFredSel({
		items       : {
			visible : 1,
			width   : 300,
			height  : 300,
			start   : 2
		},
		auto		  : false,
		swipe		  : {
			onTouch	  : true,
			onMouse	  : true
		},
		height: 300,
		width: 300,
		prev: ".quick-prouct-image-lg-prev",
		next: ".quick-prouct-image-lg-next"
	});

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

	// Style form radio btn
	$('input[type=radio]').on('change', function () {
			var $this = $(this),
					name = $this.attr('name'),
					form  = $this.closest('form');

			form.find('input[name=' + name + ']').parent().removeClass('checked');
			form.find('input[name=' + name + ']:checked').parent().addClass('checked');
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

	// Emulate input type number
	$('.input-type-number a').on('click', function (e) {
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

	// Change main product image
	$('.product-images > li > a').on('click', function (e) {
		$('#prouct-image-lg img').attr({
			src: $(this).data('image')
		});

		e.preventDefault();
	});

	// Animate product image thumbs border colors
	$('.product-images > li').on('mouseenter', function () {
		$(this).animate({
			borderColor: "#ededed",
			opacity: "1"
		}, 200);
	});

	$('.product-images > li').on('mouseleave', function () {
		$(this).animate({
			borderColor: "#f7f7f7",
			opacity: "0.6"
		}, 200);
	});

	// Style selects
	$('select').selectpicker();

	// Switch to grid/list view
	$('#catalog-grid-view, #catalog-list-view').on('click', function (e) {
		$(this).siblings('a').removeClass('active').end().addClass('active');

		e.preventDefault();
	});

	// Animate cart repeat icon
	$('table.cart .repeat').on('mouseenter', function () {
		$(this).animate({
			color: '#00be9c'
		}, 200);
	});

	$('table.cart .repeat').on('mouseleave', function () {
		$(this).animate({
			color: '#c9c9c9'
		}, 200);
	});

	// Animate cart close icon
	$('table.cart .close').on('mouseenter', function () {
		$(this).animate({
			color: '#323232'
		}, 200);
	});

	$('table.cart .close').on('mouseleave', function () {
		$(this).animate({
			color: '#c9c9c9'
		}, 200);
	});

	// Animate product tabs headings
	$('#pager a').on('mouseenter', function () {
		$(this).animate({
			color: '#323232',
			borderColor: '#e67e22'
		}, 200);
	});

	$('#pager a').on('mouseleave', function () {
		$(this).animate({
			color: '#a9a9a9',
			borderColor: '#eee'
		}, 200);
	});

	// Animate sidebar catalog widget children links
	$('.sidebar .nav > li > a').on('mouseenter', function () {
		$(this).animate({
			color: '#e67e22'
		}, 200).children('span').animate({
			color: '#323232'
		}, 200);
	});

	$('.sidebar .nav > li > a').on('mouseleave', function () {
		$(this).animate({
			color: '#323232'
		}, 200).children('span').animate({
			color: '#c8c8c8'
		}, 200);
	});

	$('.sidebar .nav > li > ul a').on('mouseenter', function () {
		$(this).animate({
			color: '#e67e22'
		}, 200);
	});

	$('.sidebar .nav > li > ul a').on('mouseleave', function () {
		$(this).animate({
			color: '#a9a9a9'
		}, 200);
	});

	// Animate product preview bg and border colors
	$('.catalog > div').on('mouseenter', function () {
		$(this).animate({
			backgroundColor: "#f9f9f9",
			borderColor: "#f0f0f0"
		}, 200);
	});

	$('.catalog > div').on('mouseleave', function () {
		$(this).animate({
			backgroundColor: "#fff",
			borderColor: "#fff"
		}, 200);
	});
	
	// Animate product preview basket btn (show)
	$('.catalog > div').on('mouseenter', function () {
		var $this = $(this);

		$this.find('.btn-basket').animate({
			top: 0
		}, 200);
	});

	// Animate product preview basket btn (hide)
	$('.catalog > div').on('mouseleave', function () {
		var $this = $(this);

		$this.find('.btn-basket').animate({
			top: 70
		}, 200);
	});

	// Animate product preview icons (show)
	$('.catalog > div').on('mouseenter', function () {
		var $this = $(this);

		$this.find('.product-icon-holder a').animate({
			marginTop: 0
		}, 200);
	});

	// Animate product preview icons (hide)
	$('.catalog > div').on('mouseleave', function () {
		var $this = $(this);

		$this.find('.product-icon-holder a').animate({
			marginTop: "-50px"
		}, 200);
	});

	// Init dl-menu
	$( '#dl-menu' ).dlmenu();

	// Add tooltops
	$('.tooltiped').tooltip();

	// Slide down quick view btn
	$('.catalog>div .img-holder').mouseenter(function () {
		$(this).find('.quick-view-btn').animate({
			top: "50%"
		}, 200);
	});

	$('.catalog>div .img-holder').mouseleave(function () {
		$(this).find('.quick-view-btn').animate({
			top: "105%"
		}, 200);
	});

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

	// Increase width of the search input
	$('.navbar form .search').on('focus', function () {
		$(this).animate({
			width: 250
		}, 200, function () {
			$('.search-popup').slideDown()
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

	// Animate link colors
	$(".btn-primary").mouseenter(function () {
		$(this).animate({
			backgroundColor:"#fff",
			color: '#000'
		}, 200 );
	});

	$(".btn-primary").mouseleave(function() {
		$(this).animate({
			backgroundColor:"#e67e22",
			color: '#fff'
		}, 200 );
	});

	// Animate products view title color
	$(".catalog .title, .featured a, .cart-popup .title, table.cart .title").mouseenter(function () {
		$(this).animate({
			color: '#e67e22'
		}, 200 );
	});

	$(".catalog .title, .featured a, .cart-popup .title, table.cart .title").mouseleave(function() {
		$(this).animate({
			color: '#323232'
		}, 200 );
	});

	// Animate darkgrey btn
	$(".btn-darkgrey").mouseenter(function () {
		$(this).animate({
			backgroundColor: '#c4c9cd'
		}, 200 );
	});

	$(".btn-darkgrey").mouseleave(function() {
		$(this).animate({
			backgroundColor: '#bdc3c7'
		}, 200 );
	});

	// Animate products but btn
	$(".btn-basket, .quick-view-btn").mouseenter(function () {
		$(this).animate({
			backgroundColor: '#e98b39'
		}, 200 );
	});

	$(".btn-basket, .quick-view-btn").mouseleave(function() {
		$(this).animate({
			backgroundColor: '#e67e22'
		}, 200 );
	});

	// Animate products view icons
	$(".catalog .rounded-icon").mouseenter(function () {
		$(this).animate({
			color: '#fff',
			backgroundColor: '#e67e22',
			borderColor: '#e67e22'
		}, 200 );
	});

	$(".catalog .rounded-icon").mouseleave(function() {
		$(this).animate({
			color: '#888888',
			backgroundColor: '#fff',
			borderColor: '#f0f0f0'
		}, 200 );
	});

	// Animate products view icons
	$(".catalog .btn-grey, .product-info .btn-grey").mouseenter(function () {
		$(this).animate({
			color: '#fff',
			backgroundColor: '#e67e22',
			borderColor: '#e67e22'
		}, 200 );
	});

	$(".catalog .btn-grey, .product-info .btn-grey").mouseleave(function() {
		$(this).animate({
			color: '#a9a9a9',
			backgroundColor: '#fff',
			borderColor: '#f0f0f0'
		}, 200 );
	});

	// Animate mini product close icons
	$(".cart-popup .close").mouseenter(function () {
		$(this).animate({
			color: '#fff',
			backgroundColor: '#e67e22',
			borderColor: '#e67e22'
		}, 200 );
	});

	$(".cart-popup .close").mouseleave(function() {
		$(this).animate({
			color: '#888888',
			backgroundColor: '#fff',
			borderColor: '#f0f0f0'
		}, 200 );
	});

	$(".navbar-nav li a").mouseenter(function () {
		$(this).animate({
			backgroundColor:"#d35400",
		}, 200 );
	});

	$(".navbar-nav li a").mouseleave(function() {
		$(this).animate({
			backgroundColor:"#e67e22",
		}, 200 );
	});

	// Animate top line links
	$(".top-line .general-info a").mouseenter(function () {
		$(this).animate({
			color: "#e67e22",
		}, 200).find('span').animate({
			color: "#505050",
		}, 200);
	});

	$(".top-line .general-info a").mouseleave(function() {
		$(this).animate({
			color: "#888888",
		}, 200).find('span').animate({
			color: "#888888",
		}, 200);
	});

	// Animate static links
	$("a.static").mouseenter(function () {
		$(this).animate({
			color: "#323232",
		}, 200);
	});

	$("a.static").mouseleave(function() {
		$(this).animate({
			color: "#888888",
		}, 200);
	});
});