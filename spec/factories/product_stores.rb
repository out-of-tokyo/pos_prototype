# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product_store do
    price 108
    stock 5
    store_id 1
    product_id 1
  end
end
