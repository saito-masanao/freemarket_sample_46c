FactoryBot.define do

  factory :item do
    name            {"10万ボルト"}
    description     {"技マシーン"}
    category_id     {"1"}
    brand_id        {"1"}
    status          {"good"}
    delivery_fee    {"0"}
    delivery_date   {"0"}
    delivery_method {"1"}
    prefecture_id   {"1"}
    price           {"10000"}
    size            {"XS"}
    user_id         {"user"}
    created_at { Faker::Time.between(10.days.ago, Time.now, :all) }
    updated_at { Faker::Time.between(5.days.ago, Time.now, :all) }
  end
end

