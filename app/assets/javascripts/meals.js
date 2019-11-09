
function listenCommentButtonClick(){
  // $("#print_comments").hide()
  $("#new_comment").on("submit", function(event){

    event.preventDefault();

    let values = $(this).serialize();
    let attributes = $.post('/comments', values);

    addComment(attributes)
    clearCommentBox()

    });

  }

function addComment(attributes){

  attributes.done(function(data){
    let comment = new Comment(data);
    $("#print_comments").show()
    // $('#commentName').text(comment["user"].name);
    // $('#commentBody').text(comment["content"]);
    // $('#commentTime').text(comment["created_at"]);

    comment.addCommentPrototype()
  });
}

function clearCommentBox(){
  $("#comment_content").val('')
}


function Comment(attr){
  this.id = attr.id;
  this.user = attr.user.name;
  this.content = attr.content;
  this.time = attr.created_at;
  this.meal_id = attr.meal.id;

}

Comment.prototype.addCommentPrototype = function(){
  let html = '<p>On ' + this.time + ', ' + this.user + ' said: "' + this.content + '"</p>'
  $("#print_comments").prepend(html)
}
