# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :link_vote do
    voter_id 1
    link_id 1
    vote 1
  end
end
