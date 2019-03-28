$(function(){
  function buildNewCommentHTML(comment){
    var html =`<li class='is-item__comment--self clearfix'>
                 <a href = "", class = "is-item__comment--self__user">
                   <figure>
                     <img class = "", src = "http://localhost:3000/assets/ikkyu-1a82e9bbfc3f7cb61b6933f35c13a7f34e40445c8664d85e4092d65012e8f099.jpg">
                     <figcaption>${comment.user_name}</figcaption>
                   </figure>
                 </a>
                 <div class = 'is-item__comment--self__body body'>
                   <div class = 'is-item__comment__body__text' >${comment.text}</div>
                   <div class = 'is-item__comment__body__icons clearfix'>
                     <time>
                       <i class = 'fa fa-clock-o'></i>
                       <span>${comment.created_time}前</span>
                     </time>
                   </div>
                 </div>
               </li>`
    return html;
  }

  $('#comment-form').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false,
    })
    .done(function(new_comment){
      var html = buildNewCommentHTML(new_comment);
      $('.comments').append(html);
      $('.is-item__comment-form__textarea').val('')
    })
    .fail(function(){
      alert('error');
    })
  });
});
