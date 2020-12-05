FactoryBot.define do
  factory :doi_record, class: ::DoiRecord do |f|
    association :manifestation
    sequence(:body){|n| "10.12345/000#{n}"}
  end
end
