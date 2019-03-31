$(document).on('turbolinks:load', function() {
  const PAYJP_PUBLIC_KEY="pk_test_336046173393efb07571501f";
  const TEST_CARD = [
    {
      "bland":     "Visa",
      "number":    "4242424242424242",
      "csv":       "123",
      "exp_month": "11",
      "exp_year":  "2020",
    },
    {
      "bland":     "Visa",
      "number":    "4012888888881881",
      "csv":       "123",
      "exp_month": "10",
      "exp_year":  "2020",
    },
    /*
    [@ToDo]以下のテストカードのコード化はひとまず保留
    5555555555554444	MasterCard
    5105105105105100	MasterCard
    3530111333300000	JCB
    3566002020360505	JCB
    378282246310005	American Express
    371449635398431	American Express
    38520000023237	Diners Club
    30569309025904	Diners Club
    6011111111111117	Discover
    6011000990139424	Discover
    */
  ]

  /*
  ユーザーが入力したカード情報を取得する関数
  test_mode=trueの時はテストモードで処理する。
  */
  function get_card_info(test_mode) {
    let card_info = {};
    if(test_mode) {
      // [@ToDo]できたらデバッグモードの時だけカード番号入力した値で反映させる予定
      // data_num = $('#credit_card_number').val();
      let _test_num = 0
      card_info["number"]    = TEST_CARD[_test_num]["number"];
      card_info["cvc"]       = TEST_CARD[_test_num]["csv"];
      card_info["exp_month"] = TEST_CARD[_test_num]["exp_month"];
      card_info["exp_year"]  = TEST_CARD[_test_num]["exp_year"];
    } else {
      card_info["number"]    = $('#credit_card_number').val();
      card_info["cvc"]       = $('#credit_card_security_code').val();
      card_info["exp_month"] = $('#credit_month option:selected').val();
      card_info["exp_year"]  = "20" + $('#credit_year option:selected').val();
    }
    console.log(card_info); /* [@kari] デバッグ用 */
    return card_info
  }

  /*
  カード情報と紐付くトークンを取得する
  [@kari] エラーだった時は「""」を返す
  */
  function get_token(card_info) {
    return new Promise(resolve => {
      let _response;

      Payjp.setPublicKey(PAYJP_PUBLIC_KEY);
      Payjp.createToken(card_info, function(status, response) {
        /* トークン生成成功判定*/
        if (response.error) {
          console.log(response.error.message);
          _response = "";
        } else {
          console.log('aa %s',response.id);
          _response = response.id;
        }
        return resolve(_response);
      });
    });
  }

  $('#submit-button').click(function() {
    console.log("クレジットカード制御用のjsファイル作成");
    (async()=> {
      let card_token;
      let card_info = get_card_info(true); /* [@kari]最終的にはfalseにする */
      await get_token(card_info).then(function(v){card_token=v;});
      $('#card_token').attr('value', card_token);
      $('#credit_form').submit();
    })();
  });
});
