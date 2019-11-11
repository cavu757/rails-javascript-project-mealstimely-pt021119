//= require jquery

$(document).on('turbolinks:load', function(){
  listenMealsIHaveCreatedButtonClick();
  listenCommentButtonClick();
  listenNextFoodClick();
  listenPreviousFoodClick();
  listenFoodAvailableThisWeek();
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
    '<a href="/meals/' + meal.id + '"><img src="' + meal.food.picture + '" width="75%"></a>' +
    '<h5>Cooked by: ' + meal.food.cook.name  +
    '</h5><h6>Total Comments: <strong>' + meal.comments.length + '</strong></h6></div>');
  });

}

function listenFoodAvailableThisWeek(){
  $('#food-available-this-week').on('click', function(event) {
    event.preventDefault();
    clearFoodCreatedBox();
    showFood();
  });
}

function clearFoodCreatedBox(){
  $("#food-created").empty();

}

function showFood(){
  $.get('/foods.json', function(json){
    let idFood = Math.ceil(Math.random() * json.length);
    $.get('/foods/'+idFood+'.json', function(food){
    $('#food-created').append(
    '<div class="index-box">' +
    '<h2>' + food.name + '</h2><h4>by ' +
    food.cook.name + '</h4>' +
    '<a href="/foods/' + food.id + '"><img src="' + food.picture + '" width="75%"></a>' +
    '<h5>Click on Food for More Info and to Create a Meal</h5></div>');
  })
})
}
