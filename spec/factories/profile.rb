FactoryBot.define do
  factory :profile, class: Profile do |f|
    f.required_role_id {Role.find_by(name: 'User').id}
    f.sequence(:user_number){|n| "user_number_#{n}"}
    f.locale { "ja" }
    factory :librarian_profile, class: Profile do |profile|
      profile.required_role_id {Role.find_by(name: 'Librarian').id}
    end
    factory :admin_profile, class: Profile do |profile|
      profile.required_role_id {Role.find_by(name: 'Administrator').id}
    end
  end
end
