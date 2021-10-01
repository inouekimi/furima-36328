FactoryBot.define do
  factory :item do
    name {"机"}
    explanation {"白色"}
    category_id {2}
    status_id {2}
    shipping_charges_id {2}
    shipping_area_id {2}
    days_to_id {2}
    price {2000}
    user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
