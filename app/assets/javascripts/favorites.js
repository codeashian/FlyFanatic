
$(document).ready(function(){

  $("#favor").click(function() {
  var post_id = $(this).attr('id');
  $.ajax({
    type: "POST",
    url: 'favorites/' + post_id,
    success: function() {
      // change image or something
    }
  })
})

$(".twitter-box").click(function() {
  console.log(this);
  var form = $(this).next('.custom-search-pop-up');
  form.toggle();
  $(".big-overlay").toggle();
  alert("hej");
});


	//  show search-form on front page








  //   ********************************

  	$('#favorite_distance').change(function() {
  		$('#range-value').html('<p>' + $(this).val() + 'km </p>');
  	})

  	$('#resp-nav i').click(function() {
  	if (!$('#resp-nav').hasClass('open')) {
      $('#resp-nav').css('width', '100%');
      $('#resp-nav').css('backgroundColor', 'black');
  		$('.resp-nav-box').css('display','inline-block');
  		$('.nav-box').addClass('animated fadeInLeft');
  		$('#resp-nav').addClass('open');
  	}
  	else {
  		$('#resp-nav').removeClass('open');
      $('#resp-nav').css('width', 'auto');
      $('#resp-nav').css('backgroundColor', 'transparent');
  		$('.resp-nav-box').css('display','none');
  		$('.nav-box').removeClass('animated fadeInLeft');
  		
  	}
  	});

  	$(".fancybox")
    .attr('rel', 'gallery')
    .fancybox({
    	helpers : {
        title: {
            type: 'inside',
            position: 'bottom'
        }
    },
        padding : 10

    });


// Launch fancyBox on first element
	$(".fancybox").eq(0).trigger('click');

})
