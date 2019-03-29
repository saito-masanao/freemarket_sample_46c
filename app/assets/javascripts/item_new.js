$(document).on('turbolinks:load', function(){

  var inputFieldList = $(".is-add-up")
 function appendImage(img,i,imageList) {
   var html = `<li class="is-image-li" id="${i}">
                <figure class="is-image-li__figure">
                  <img src="${img}">
                </figure>
                <div class="is-image-li__under">
                  <a href="#" class="is-image-li__under--e">編集<a>
                  <a href="#" class="is-image-li__under--e">削除<a>
                </div>
              </li>`
   imageList.append(html);
  }

  function appendInputField(isImgId){
    var html =`<input id="is-img-${isImgId+1}" multiple="multiple"  data-id="${isImgId+1}" class="is-upload-box-container__box--file" type="file" name="item_form[image][]">`
  inputFieldList.append(html);
  }

  function addClass(){
    switch (imgCount){
      case 1:
        $("#is-add").addClass("is-item-1");
        break;
      case 2:
        $("#is-add").addClass("is-item-2");
        break;
      case 3:
        $("#is-add").addClass("is-item-3");
        break;
      case 4:
        $("#is-add").addClass("is-item-4");
        break;
      case 5:
        $("#is-add").addClass("is-item-5");
        break;
      case 6:
        $("#is-add").addClass("is-item-1");
        break;
      case 7:
        $("#is-add").addClass("is-item-2");
        break;
      case 8:
        $("#is-add").addClass("is-item-3");
        break;
      case 9:
        $("#is-add").addClass("is-item-4");
        break;
      case 10:
        $("#is-add").addClass("is-item-5");
        break;
    }
  }

    function removeClass(imgCount){
    switch (imgCount){
      case 1:
        $("#is-add").removeClass("is-item-1");
        break;
      case 2:
        $("#is-add").removeClass("is-item-2");
        break;
      case 3:
        $("#is-add").removeClass("is-item-3");
        break;
      case 4:
        $("#is-add").removeClass("is-item-4");
        break;
      case 5:
        $("#is-add").removeClass("is-item-5");
        break;
      case 6:
        $("#is-add").removeClass("is-item-1");
        break;
      case 7:
        $("#is-add").removeClass("is-item-2");
        break;
      case 8:
        $("#is-add").removeClass("is-item-3");
        break;
      case 9:
        $("#is-add").removeClass("is-item-4");
        break;
      case 10:
        $("#is-add").removeClass("is-item-5");
        break;
    }
  }


// 未アップロード時のラベルのforを取得する
     isLabelFor = $(".is-upload-box-container").find("#is-add").attr("for");
// ファイルの初期化
     file = ""

     imgCount = 0
//
// ラベルのforと同じIDのファイルアップローダーが開いた時に発火する///////////////////////
  $(".is-upload-box-container").change(`#${isLabelFor}`,function(e){
    e.preventDefault();
// アップローダーのdata-idを取得
      var isImgId = $(this).find(`#${isLabelFor}`).data('id');
// アップローダーで選択したimageファイルを取得
     file = $(this).find(`#${isLabelFor}`).prop('files')[0];

     var permitType = ['image/jpeg', 'image/png', 'image/gif'];
            if (file && permitType.indexOf(file.type) == -1) {
                alert('この形式のファイルはアップロードできません');
                $(this).find(`#${isLabelFor}`).val('');
                return
              }
      var reader = new FileReader()
      reader.onload = function(e){
      var imgName = e.target.result;
// 取得したimgをプレビューさせる
      if (imgCount >= 5){
        imageList = $("#is-image-ul-2");
        } else {
        imageList = $("#is-image-ul-1");
        }
      appendImage(imgName,isLabelFor,imageList);
//次のアップローダーを追加する
      appendInputField(isImgId);
//viewの幅を変更させるクラスの追加
    if (imgCount < 9){
      removeClass(imgCount)
      imgCount = imgCount + 1
      addClass(imgCount)
    } else {
      imgCount = imgCount + 1
      $("#is-add").removeClass();
      $(".is-upload-box-container__box--text").text("");
    }
//次の画像を選択させるためにlabelのforを変更
      $("#is-add").attr("for",`is-img-${isImgId+1}`);
//変更後のlabelのforを取得
       isLabelFor = $(".is-upload-box-container").find("#is-add").attr("for")
  }
    reader.readAsDataURL(file);
  });
////////////////////////////////////////////////////////////////////////////////
//
////削除ボタンの処理//////////////////////////////////////////////////////////////
  $(".is-upload-box-container").on("click",".is-image-li__under--e",function(e){
    e.preventDefault();
//削除対象のliのIDを取得
    var imgId = $(this).parent().parent().attr("id");
//liのidに紐づくinputタグのdata-idを取得
    var imgNo = $(".is-add-up").find(`#${imgId}`).data('id');
    if (imgCount < 10){
      removeClass(imgCount)
      imgCount = imgCount - 1
      addClass(imgCount)
    } else {
      imgCount = imgCount - 1
      $("#is-add").addClass("is-upload-box-container__box is-item-4");
      $(".is-upload-box-container__box--text").text("ドラッグアンドドロップまたはクリックしてファイルをアップロード");
    }
    $(this).parent().parent().remove();
    $(".is-add-up").find(`#${imgId}`).remove();
  })
//////////////////////////////////////////////////////////////////////////////////

});
