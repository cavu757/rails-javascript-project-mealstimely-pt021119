

function listenNextFoodClick(){

  // $("#print_comments").hide()
  $("#next_food").on("click", function(event){

    event.preventDefault();
    let idFood = $("#next_food").attr("data")

    $.get("/foods.json", function(json){
      if (idFood > json.length){
        alert("This is the last food available")
      }else{
        $.get("/foods/"+idFood+".json", function(json){


        });
      }
    })

  });

}

function listenPreviousFoodClick(){

  // $("#print_comments").hide()
  $("#previous_food").on("click", function(event){

    event.preventDefault();
    let idFood = $("#previous_food").attr("data")

    $.get("/foods.json", function(json){
      if (idFood == 0){
        alert("Meal does not exist")
      }

    })

  });

}


// <h1><a id="previous_food" data="<%=@food.id-1%>" href="<%=@food.id-1%>" class="btn btn-default active" role="button">Previous</a> <%= @food.name.titleize %> <a id="next_food" data="<%=@food.id+1%>" href="<%=@food.id+1%>" class="btn btn-default active" role="button">Next</a></h1>
