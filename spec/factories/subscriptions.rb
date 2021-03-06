# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :subscription do |f|
    f.plan_id {Faker::Name.first_name}
    f.stripe_customer_token {Faker::Name.first_name}
  end

  factory :invalid_subscription, parent: :subscription do |f|
    f.plan_id nil
  end
end