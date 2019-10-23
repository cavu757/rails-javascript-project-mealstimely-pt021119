# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ Food.create(name: 'Star Wars' }, { Food.create(name: 'Lord of the Rings' }])
#   Character.create(Food.create(name: 'Luke', movie: movies.first)

User.create(
  name: "John Smith",
  email: "cook1@email.com",
  password: "cook1",
  is_cook: true
)

User.create(
  name: "Josh Smith",
  email: "user2@email.com",
  password: "user2",
  is_cook: false
)

User.create(
  name: "Josh Michael",
  email: "cook3@email.com",
  password: "cook3",
  is_cook: true
)

Food.create(
name: "ceviche",
picture: "https://www.simplyrecipes.com/wp-content/uploads/2009/08/ceviche-vertical-a-1800.jpg",
description: "Ceviche, also cebiche, seviche or sebiche,(Spanish pronunciation: [seˈβitʃe]) is the seafood dish originated in Peru typically made from fresh raw fish cured in citrus juices, such as lemon or lime, and spiced with ají, chili peppers or other seasonings including chopped onions, salt, and cilantro. Because the dish is not cooked with heat, it must be prepared and consumed fresh to minimize the risk of food poisoning.",
cook_id: 1
)

Food.create(
name: "fried chicken",
picture: "https://thestayathomechef.com/wp-content/uploads/2016/06/Fried-Chicken-4-1-500x375.jpg",
description: "Southern fried chicken, also known simply as fried chicken, is a dish consisting of chicken pieces which have been coated in a seasoned batter and pan-fried, deep fried, or pressure fried. The breading adds a crisp coating or crust to the exterior of the chicken while retaining juices in the meat. Broiler chickens are most commonly used.",
cook_id: 1
)

Food.create(
name: "best burger ever",
picture: "https://www.seriouseats.com/recipes/images/2015/07/20150702-sous-vide-hamburger-anova-primary-1500x1125.jpg",
description: "A hamburger (short: burger) is a sandwich consisting of one or more cooked patties of ground meat, usually beef, placed inside a sliced bread roll or bun. The patty may be pan fried, grilled, or flame broiled. Hamburgers are often served with cheese, lettuce, tomato, onion, pickles, bacon, or chiles; condiments such as ketchup, mayonnaise, mustard, relish, or special sauce; and are frequently placed on sesame seed buns. A hamburger topped with cheese is called a cheeseburger.",
cook_id: 1
)

Food.create(
name: "seco de carne",
picture: "https://media-cdn.tripadvisor.com/media/photo-s/02/35/57/96/seco-de-carne.jpg",
description: "Seco is a popular stewed meat plate served in Peru and Ecuador. One popular variation is seco de cordero (stewed Lamb)",
cook_id: 1
)

Food.create(
name: "bacon",
picture: "https://www.lemonblossoms.com/wp-content/uploads/2019/01/Bacon-in-the-Oven-S1.jpg",
description: "Bacon ipsum dolor amet turducken prosciutto chicken andouille landjaeger. Corned beef cupim beef, tenderloin leberkas flank andouille picanha pig pancetta. Tenderloin doner beef, cow picanha landjaeger meatball brisket chicken shoulder tail tongue andouille turducken. Doner chuck jerky ball tip tri-tip cow. Buffalo chuck pork chop biltong pancetta sirloin ball tip sausage hamburger capicola jerky.",
cook_id: 1
)

Food.create(
name: "bacon2",
picture: "https://cached.dakinfarm.com/RS/SR/Product/88/860_R_1ba464e5.jpg",
description: "Heat a cast-iron or other heavy skillet over medium heat. When hot, add bacon strips in a single layer. Flip bacon, using tongs, and cook until browned on both sides, about 2 minutes. Drain and reserve fat for another use, and repeat with remaining bacon. Drain bacon on paper towels.",
cook_id: 3
)

Food.create(
name: "lemon water",
picture: "https://www.foodiesfeed.com/wp-content/uploads/2019/04/mae-mu-pouring-water-413x516.jpg",
description: "Lemon water is simply the juice from lemons mixed with water. The amount of lemon you use depends on your personal preference, and this drink can be enjoyed either cold or hot. Some people also choose to add lemon rind, mint leaf or other ingredients.",
cook_id: 3
)

Food.create(
name: "lentils",
picture: "https://downshiftology.com/wp-content/uploads/2019/02/lentils-5-500x500.jpg",
description: "Lentils are mini-sized legumes that pack a mighty dose of nutrition! ... Here’s a guide to the different types of lentils and how they vary in taste, texture, and uses. ... I love cooking with lentils because it’s a high-fiber food–though lentils are high in carbohydrates and protein.",
cook_id: 3
)

Meal.create(
  user_id: 2,
  food_id: 1,
  cook_id: 1
)

Meal.create(
  user_id: 2,
  food_id: 2,
  cook_id: 1
)

Meal.create(
  user_id: 1,
  food_id: 3,
  cook_id: 1
)
