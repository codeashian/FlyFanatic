
$(document).ready(function(){


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

  	$('#favorite_distance').change(function() {
  		$('#range-value').html('<p>' + $(this).val() + 'km </p>');
  	})

  	$('#resp-nav i').click(function() {

  	if (!$('#resp-nav').hasClass('open')) {
  		$('#resp-nav').css('backgroundColor', 'black');
  		$('.resp-nav-box').css('display','inline-block');
  		$('.nav-box').addClass('animated fadeInLeft');
  		$('#resp-nav').addClass('open');
  	}
  	else {
  		$('#resp-nav').removeClass('open');
  		$('#resp-nav').css('backgroundColor', 'transparent');
  		$('.resp-nav-box').css('display','none');
  		$('.nav-box').removeClass('animated fadeInLeft');
  		
  	}
  	});

})
