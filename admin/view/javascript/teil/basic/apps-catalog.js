/**
 * Apps catalog
 */
function AppCatalog(token) {
	AppCatalog.prototype.token = token;

	// Set default template
	AppCatalog.prototype.appTemplate = '#app-template';
	AppCatalog.prototype.$appTemplate = $(AppCatalog.prototype.appTemplate);

	AppCatalog.prototype.$container = $('#apps-container');
};


/**
 * Default settings
 */
AppCatalog.prototype.token = null;
AppCatalog.prototype.appTemplate = null;
AppCatalog.prototype.$appTemplate = null;
AppCatalog.prototype.$container = null;


/**
 * Initialization of the number slider
 *
 * @return void
 */
AppCatalog.prototype.init = function() {
	this.loadApps().done(this.render);
};



/**
 * Load apps
 *
 * @return mixed
 */
AppCatalog.prototype.loadApps = function() {
	var promise = $.ajax({
		url: '/apps-demo.json',
		type: 'post',
		dataType: 'json'
	});

	return promise;
};


/**
 * Bind events
 *
 * @return void
 */
AppCatalog.prototype.bindEvents = function() {
	this.$container.find('.download-app-action').on('click', this.installModule);
};


/**
 * Show apps on the screen
 *
 * @return void
 */
AppCatalog.prototype.render = function(json) {
	var source = AppCatalog.prototype.$appTemplate.html(),
		template = Handlebars.compile(source),
		html = template(json);

	AppCatalog.prototype.$container.find('.app-list').html(html);

	AppCatalog.prototype.bindEvents();
};


/**
 * Install new app
 *
 * @return void
 */
AppCatalog.prototype.installModule = function(e) {
	var $this = $(this);

	$this.attr('disabled', 'disabled').addClass('loading');

	AppCatalog.prototype.downloadModule(
		$this,
		$this.data('module-name'),
		$this.data('module-download-path')
	);

	e.preventDefault();
};


/**
 * Perform download a new app(module)
 *
 * @return void
 */
AppCatalog.prototype.downloadModule = function($btn, moduleName, modulePath) {
	var moduleDownloader = new ModuleDownloader($btn, moduleName, modulePath, this.token);
	moduleDownloader.download();
	moduleDownloader.progress();
};