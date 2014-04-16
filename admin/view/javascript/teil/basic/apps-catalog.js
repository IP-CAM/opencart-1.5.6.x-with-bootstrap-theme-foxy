/**
 * Apps catalog
 */
function AppCatalog(token) {
	AppCatalog.prototype.token = token;

	// Set default template
	AppCatalog.prototype.appTemplateNotInstalled = '#app-template-not-installed';
	AppCatalog.prototype.$appTemplateNotInstalled = $(AppCatalog.prototype.appTemplateNotInstalled);

	AppCatalog.prototype.appTemplateInstalled = '#app-template-installed';
	AppCatalog.prototype.$appTemplateInstalled = $(AppCatalog.prototype.appTemplateInstalled);

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
	this.loadApps().done(this.appsLoaded);
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
 * Get list of already installed apps
 *
 * @return void
 */
AppCatalog.prototype.loadMyApps = function() {
	var promise = $.ajax({
		url: '/admin/index.php?route=teil/home/my&token=' + AppCatalog.prototype.token,
		type: 'post',
		dataType: 'json'
	});

	return promise;
};


/**
 * Triggers when apps(list of all apps) are fetched
 *
 * @return void
 */
AppCatalog.prototype.appsLoaded = function(allAppsJson) {
	var filtered;

	// List of nstalled apps (my apps) are loaded
	AppCatalog.prototype.loadMyApps().done(function(myAppsJson) {
		// Filter apps, and get `not installed` list of apps
		filtered = AppCatalog.prototype.filter(allAppsJson, myAppsJson);

		AppCatalog.prototype.render(filtered);
	});
};


/**
 * Bind events
 *
 * @return void
 */
AppCatalog.prototype.bindEvents = function() {
	this.$container.find('.download-app-action').on('click', this.installModule);
	this.$container.find('.remove-app-action').on('click', this.removeModule);
};


/**
 * Show apps on the screen
 *
 * @return void
 */
AppCatalog.prototype.render = function(json) {
	var notInstalledTemplateSource = AppCatalog.prototype.$appTemplateNotInstalled.html(),
		installedTemplateSource = AppCatalog.prototype.$appTemplateInstalled.html();

	var appTemplate, html;

	// Append already installed apps
	appTemplate = Handlebars.compile(installedTemplateSource);
	html = appTemplate(json.installed);
	AppCatalog.prototype.$container.find('.app-list-installed').html(html);

	// Append not installed apps
	appTemplate = Handlebars.compile(notInstalledTemplateSource);
	html = appTemplate(json.notInstalled);
	AppCatalog.prototype.$container.find('.app-list-not-installed').html(html);

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
 * Remove app
 *
 * @return void
 */
AppCatalog.prototype.removeModule = function(e) {
	var $this = $(this);

	$.ajax({
		url: '/admin/index.php?route=teil/home/remove&token=' + AppCatalog.prototype.token,
		type: 'post',
		dataType: 'json',
		data: {
			module_name: $this.data('module-name')
		}
	})
	.done(function() {
		console.log("Module `" + $this.data('module-name') + "` has been removed");
	})
	.fail(function() {
		console.log("error");
	});
	

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


/**
 * Here we are going to divide all json apps to:
 * - already installed (my)
 * - avalible to be installed (apps)
 *
 * @return void
 */
AppCatalog.prototype.filter = function(allAppsJson, myAppsJson) {
	var installed = { apps: [] },
		notInstalled = { apps: [] };

	// If there is no installed apps 
	// we will simply push all apps into `uninstalled` list
	if (myAppsJson.apps.length <= 0) {
		notInstalled = allAppsJson;
	};

	$.each(allAppsJson.apps, function(index, module) {
		$.each(myAppsJson.apps, function(moduleName, moduleServiceProvider) {
			
			if (module.download_name == moduleName) {
				installed.apps.push(module);
			} else {
				notInstalled.apps.push(module);
			};

		});
	});

	return {
		installed: installed,
		notInstalled: notInstalled,
		all: allAppsJson
	};
};