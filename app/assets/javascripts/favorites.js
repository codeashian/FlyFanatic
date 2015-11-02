
$(document).ready(function(){


	$("p.search-link").click(function() {
		var form = $(this).next('.big-overlay');
		form.toggle();

	})

	//  show search-form on front page

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

  //   ********************************


})
