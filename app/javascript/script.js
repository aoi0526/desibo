/* global $ */$(document).on('turbolinks:load', function() {
  $(document).ready(function(){
    $('.slider').slick({
      autoplay: true,
      autoplaySpeed: 3000,
      dots: true,
    }).removeClass('slider');
  });
});


$(window).on('scroll', function() {
  scrollHeight = $(document).height();
  scrollPosition = $(window).height() + $(window).scrollTop();
  if ( (scrollHeight - scrollPosition) / scrollHeight <= 0.05) {
    $('.jscroll').jscroll({
      contentSelector: '.scroll-list',
      nextSelector: 'span.next:last a',
      loadingHtml: '<p class="loading">Loading...</>',
      callback: function(){
        $('.slider').slick({
          autoplay: true,
          autoplaySpeed: 3000,
          dots: true,
        }).removeClass('slider');
      }
    });
  }
});


