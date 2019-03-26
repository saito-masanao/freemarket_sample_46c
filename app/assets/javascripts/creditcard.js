$(function() {
  $('.credit-right-content__wrapper__box__form').on('submit', function(e) {
    e.preventDefault();
    console.log("クレジットカード制御用のjsファイル作成");
    $(".submit-button").prop("disabled", false);
  });
});
