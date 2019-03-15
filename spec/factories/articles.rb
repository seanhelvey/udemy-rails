FactoryBot.define do
  factory :article do
    sequence(:title) { |n| "My awesome title #{n}" }
    sequence(:content) { |n| "My awesome content #{n}" }
    sequence(:slug) { |n| "my-awesome-slug-#{n}" }
  end
end
