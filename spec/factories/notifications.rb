FactoryBot.define do
  factory :notification do
    phone "5555555555"
    body "My message"
    source_app "some_app"
  end

  factory :second_notification, class: 'Notification' do
    phone "8568568568"
    body "My 2nd message"
    source_app "some_app x2"
  end
end