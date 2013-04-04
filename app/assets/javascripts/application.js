// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require_tree .
$(document).ready(function()
{

	
	$(".dropdown_menu").click(function()
	{
		var active = $(this).attr('data-active');
		if(active == 1)
		{
			$(".submenu").hide();
			$(this).attr('data-active', '0'); 
		}
		else
		{
			$(".submenu").show();
			$(this).attr('data-active', '1');
		}
	});

	$(".submenu").mouseup(function()
	{
		return false
	});

	$(".dropdown_menu").mouseup(function()
	{
		return false
	});

	$(document).mouseup(function()
	{
		$(".submenu").hide();
		$(".dropdown_menu").attr('data-active', '');
	});
});
