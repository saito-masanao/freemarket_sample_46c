FactoryBot.define do

  factory :item do
    name            {"10万ボルト"}
    description     {"技マシーン"}
    category_id     {"category"}
    brand_id        {"brand"}
    status          {"good"}
    delivery_fee    {"include"}
    delivery_date   {"one_to_two"}
    delivery_method {"easy_mercari_mail"}
    prefecture_id   {"1"}
    price           {"10000"}
    size            {"XS"}
    user_id         {"user"}
  end
end
