$(function () {

  $('.category__list').hover(
    function () {
      $(this).children('ul').show();
    },
    function () {
      $(this).children('ul').hide();
    }
  );
  $('.top-main-header-nav-parent').hover(
    function () {
      $(this).children('ul').show();
    },
    function () {
      $(this).children('ul').hide();
    }
  );
  $('.top-main-header-nav-child').hover(
    function () {
      $(this).children('ul').show();
    },
    function () {
      $(this).children('ul').hide();
    }
  );


});