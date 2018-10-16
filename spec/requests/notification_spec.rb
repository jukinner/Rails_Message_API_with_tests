require 'rails_helper'

RSpec.describe Notification, type: :request  do 
  before(:each) do
    @client = FactoryBot.build_stubbed(:client)
  end

  it 'returns ok and a 200' do
    get notifications_path
    expect(response.status).to eq(200)
    expect(response.body).to eq('ok')
  end

  it "creates a Notification" do 

    post "/notifications",
    :params => {
      notification: {
        phone: "1234567890",
        body: "My test Message",
        source_app: "my_app"
      }
    }, xhr: true

    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status(:created)
  end

  it "renders an error message if the notification was not created" do 

    headers = { "CONTENT_TYPE" => "application/json" }
    post "/notifications",
    :params => {
      notification: {
        phone: "1234567890",
        body: "my_app",
      }
    }, xhr: true

    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status(:unprocessable_entity)
  end
end