FactoryBot.define do
  factory :post do
    author { create(:user) }
    title { "Test Post Title" }
    body { "Test Post Body" }
  end
end
