require 'rails_helper'

RSpec.describe Notification, type: :request  do 
  before do 
    client = FactoryBot.create(:client)

    @headers = { "HTTP_AUTHORIZATION" => ActionController::HttpAuthentication::Basic.encode_credentials(client.source_app, client.api_key) }
  end

  it 'returns ok and a 200' do    
    get "/notifications",
    :params => { 
      notification: { 
        phone: "1234567890",
        body: "My test Message",
        source_app: "my_2nd_app"
      }
    }, :headers => @headers, xhr: true
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
    }, :headers => @headers, xhr: true

    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status(:created)
  end

  it "renders an error message if the notification was not created" do 
    post "/notifications",
    :params => {
      notification: {
        phone: "1234567890",
        body: "my_app",
      }
    }, :headers => @headers, xhr: true

    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status(:unprocessable_entity)
  end

  it 'sends a text message via the Twilio API after a notification is create' do
    post '/notifications',
    :params => {
      notification: {
        phone: "1234567890",
        body: "This is our test message", 
        source_app: "My_test_app_name"
      }
    }, :headers => @headers, xhr: true

    expect(FakeSms.messages.last.num).to eq("1234567890")
  end
end