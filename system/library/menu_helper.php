<?php 

class MenuHelper
{
	private static $template_wrapper = "<ul>{{content}}</ul>";
	private static $template_wrapper_responsive = "<ul class='responsive'>{{content}}</ul>";

	private static $heading_template = "<li class='{{self_class}}'>{{name}}</li>1";
	private static $link_template = "<li class='{{self_class}}'>{{name}}</li>2";
	private static $banner_template = "<li class='{{self_class}}'>{{name}}</li>3";

	private static $heading_template_responsive = "<li class='{{self_class}}'>{{name}}</li>4";
	private static $link_template_responsive = "<li class='{{self_class}}'>{{name}}</li>5";
	private static $banner_template_responsive = "<li class='{{self_class}}'>{{name}}</li>6";


	/**
	 * Simply get template by its key OR return the default value
	 *
	 * @return mixed
	 */
	static public function getTemplate($menuInfo, $key)
	{
		if (isset($menuInfo[$key]) AND ! empty($menuInfo[$key]) AND $menuInfo[$key])
		{
			return $menuInfo[$key];
		}
		else
		{
			return static::$$key;
		}
	}
}