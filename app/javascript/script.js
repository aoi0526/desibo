/* global $ */$(document).on('turbolinks:load', function() {
  $(document).ready(function(){
    $('.slider').slick({
      autoplay: true,
      autoplaySpeed: 3000,
      dots: true,
    });
  });
});