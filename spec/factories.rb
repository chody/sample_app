# By using the symbol ':user' we get Factory Girl to simulate the User model.

Factory.define :user do |user|
  user.name                   "Cody Hill"
  user.email                  "codyhill@example.com"
  user.password               "password"
  user.password_confirmation  "password"
end
