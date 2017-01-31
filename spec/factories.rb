FactoryGirl.define do
  factory :category do |f|
    f.sequence(:name) { |n| Faker::Beer.style }
  end

  factory :product do |f|
    f.sequence(:name) { |n| Faker::Beer.name }
    f.description Faker::Hipster.paragraphs
    f.price Faker::Number.decimal(2)
    f.image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'app', 'assets', 'images', 'product-1.jpg')) }
    f.category
  end

  factory :order do |f|
    f.name Faker::Name.name  
    f.address Faker::Address.street_address
    f.email Faker::Internet.email
    f.pay_type Faker::Number.between(0, 2)
  end
  
  factory :cart do |f|
  end
  
  factory :line_item do |f|
    f.name Faker::Name.name  
    f.address Faker::Address.street_address
    f.email Faker::Internet.email
    f.pay_type Faker::Number.between(0, 2)
  end
end