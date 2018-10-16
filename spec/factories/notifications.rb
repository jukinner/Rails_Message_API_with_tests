FactoryBot.define do
  factory :notification do
    phone { "5555555555" }
    body { "My message" }
    source_app { "my_app" }
  end

  factory :second_notification, class: 'Notification' do
    phone { "4444444444" }
    body { "Another Notification" }
    source_app { "some_app x2" }
  end
    factory :outside_notification, class: 'Notification' do
    phone { "3333333333" }
    body { "Third Notification" }
    source_app { "some_app x3" }
  end
end