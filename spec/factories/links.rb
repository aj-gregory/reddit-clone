# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :link do
    title "MyString"
    url "MyString"
    description "MyText"
    submitter_id 1

  end
end
