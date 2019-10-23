# Flatiron Rails Project - Meals For Me

The Meals For Me project is an app that allows users to sign up as eaters or cooks.  The cooks will create foods that they are willing to cook and will enter a brief description of the food.  The eaters can pick any of these foods and create a meal (future feature is to be able to schedule meals).  Once the meal is created, the eater and the cook can comment on the meal.  Meals For Me connects cooks and eaters.

## Installation

Fork database from https://github.com/cavu757/rails-project-mealstimely-pt021119.

In your terminal window, `cd` into the directory, `bundle install` all the gems, `rake db:migrate` for the tables and `rake db:seed` for the default data.  You can use default data or create your own eaters and cooks (users).

Some default data to use:

email: "cook1@email.com"
password: "cook1"

email: "user2@email.com"
password: "user2"

Run app by entering `thin start --ssl` in the terminal window.  This runs a secure server.  You have to accept the security warnings to proceed.

Visit https://localhost:3000/.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cavu757/rails-project-mealstimely-pt021119. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The app is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Meals For Me project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/cavu757/rails-project-mealstimely-pt021119/blob/master/CODE_OF_CONDUCT.md).
