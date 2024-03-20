$(document).ready(function(){

    // Slider
    if($('.dog-slider').length) {
        $('.dog-slider').slick({
            slidesToShow: 3,
            infinite: true,
            dots: false,
            responsive: [
                {
                    breakpoint: 1024,
                    settings: {
                        slidesToShow: 2,
                    }
                },
                {
                    breakpoint: 768,
                    settings: {
                        slidesToShow: 1,
                    }
                }
            ]
        });
    }

    // Overlays
    Fancybox.bind('.fancybox-overlay', {});  
    
    // Mobile menu
	$('.mobile-nav-trigger').click(function(){
		$(this).toggleClass('active');
		if($(this).hasClass('active')) {
			$('header .main-menu').animate({
				right: '0'
			}, 300);
		} else {
			$('header .main-menu').animate({
				right: '-340px'
			}, 300);
		}
		return false;
	});

});