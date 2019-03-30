$(function () {

  $('.category__list').hover(
    function () {
      $(this).children('ul').show();
    },
    function () {
      $(this).children('ul').hide();
    }
  );
});