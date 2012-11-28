FactoryGirl.define do
  factory :user do
    name          "test user"
    email         "test@example.com"
    password      "foobar"
    password_confirmation "foobar"
    about_text    "I'm a test user!"
  end
end