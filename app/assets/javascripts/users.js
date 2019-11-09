//= require jquery

$(document).on('turbolinks:load', function(){
  listenMealsIHaveCreatedButtonClick();
  listenCommentButtonClick();

});


function listenMealsIHaveCreatedButtonClick() {
  $('#food-created').val('');

  $('#meals-i-have-created').on('click', function(event) {
    event.preventDefault();

    let id = $('#meals-i-have-created').attr("data")
    $.get("/users/"+id+"/meals.json", function(json){
      if (json.length == 0){alert("You have no meals, click on food available and create some meals")}
      getUserMeals(json)
    })
  });
};

function getUserMeals(json){
  let meals = json
  $('#food-created').empty();
  meals.forEach(function(meal){

    $('#food-created').append(
    '<div class="index-box">' +
    '<h5>' + meal.created_at + '</h5><h3>' +
    meal.meal_name + '</h3>' +
    '<a href="' + meal.user.id + '/meals/' + meal.id + '"><img src="' + meal.food.picture + '" width="75%"></a>' +
    '<h5>Cooked by: ' + meal.food.cook.name  +
    '</h5><h6>Total Comments: <strong>' + meal.comments.length + '</strong></h6></div>');
  });

}
