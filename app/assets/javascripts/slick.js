$(document).on('turbolinks:load', function() {
  /* global $ */
  $('#slider').slick({
    slidesToShow: 5,
    slidesToScroll: 1,
    autoplay: true,
    dots: true,
    adaptiveHeight: false,
    speed: 700,
    pauseOnHover: true,
    prevArrow:'<div class="prev"><i class="fas fa-caret-square-left"></i></div>',
	  nextArrow:'<div class="next"><i class="fas fa-caret-square-right"></i></div>',
  });
});