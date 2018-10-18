FactoryBot.define do
  factory :client do
    source_app { "my_app" }
    api_key { "7vGXTs1LMdeNbd63UdS2UAtt" }
  end

  factory :second_client, class: 'Client' do
    source_app { "my_2nd_app" }
    api_key { "7vGXTs1LMdeNbd63UdS2UAtT" }
  end
end
