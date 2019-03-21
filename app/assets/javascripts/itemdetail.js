var slider = function() {
  var $slider = $('.slider');
  if ($slider.length < 1) { return; }

  var $thumbs = $('.thumbnails_item');

  $slider.slick({
    arrows: false
  });
};

slider();
