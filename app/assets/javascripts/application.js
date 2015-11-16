// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require jquery.turbolinks
//= require fancybox

//= require insta



 $(document).ready(function() {

 		$('#section2 span').click(function() {
		var searchform = $('.search-form');
		$(searchform).slideToggle();
		$('#section1').css('height', '300px');
		$('.start-info h2').css('paddingTop', '40px');
	})

 		 	//  Add value to custom input 
	$('.instagram-input').click(function() {
		var val = $(this).val();
		$(".custom-search-instagram").val(val)
	})

	$('.twitter-input').click(function() {
		var val = $(this).val();
		$(".custom-search-twitter").val(val)
	})

	$('.custom-search h3').click(function() {

		var div = $(this).next('.custom-search-pop');
		$(div).slideToggle();
	})

 })



