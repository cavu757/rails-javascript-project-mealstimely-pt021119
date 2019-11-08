//= require jquery

$(document).on('turbolinks:load', function(){
  listenMealsIHaveCreatedButtonClick();
});


function listenMealsIHaveCreatedButtonClick() {
  $('#food-created').val('');
  $('#meals-i-have-created').on('click', function(event) {
    event.preventDefault();
    $('#food-created').empty()
    let id = $('#meals-i-have-created').attr("data")
    $.get("/users/"+id+"/meals.json", function(json){
      if (json.length == 0){alert("You have no meals, click on food available and create some meals")}
      getUserMeals(json)
    })
  });
};

function getUserMeals(json){
  let meals = json

  meals.forEach(function(meal){

    $('#food-created').append(
    '<div class="index-box">' + '<h3>' + meal.meal_name + '</h3>' + '<img src="' + meal.food.picture + '" width="75%">' + '<p>Cooked by: ' + meal.food.cook.name  + '</p>' + '</div>');
  });

}

// var myButton = document.getElementById('my-button-id');
// var someObject = {aProperty: 'Data'};
//
// myButton.addEventListener('click', function() {
//   console.log(someObject.aProperty);  // Expected Value: 'Data'
//
//   someObject.aProperty = 'Data Again';  // Change the value
// });
//
// window.setInterval(function() {
//   if (someObject.aProperty === 'Data Again') {
//     console.log('Data Again: True');
//     someObject.aProperty = 'Data';  // Reset value to wait for next event execution
//   }
// }, 5000);
