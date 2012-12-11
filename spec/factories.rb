FactoryGirl.define do
  factory :user do
    name          "test user"
    email         "test@example.com"
    password      "foobar"
    password_confirmation "foobar"
    about_text    "I'm a test user!"
  end
  
  factory :link do
    title       "new link"
    url         "google.com"
    description "new description"
  end
end