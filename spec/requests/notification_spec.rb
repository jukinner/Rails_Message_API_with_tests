require 'rails_helper'

RSpec.describe Notification, type: :request  do 

  it "creates a Notification" do 
    headers = { "CONTENT_TYPE" => "application/json" }
    post "/notifications",
    :params => {
      notification: {
        phone: "1234567890",
        body: "My test Message",
        source_app: "My_test_app_name"
      }
    }, :headers => headers

    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status(:created)
  end

  it "creates a Notification" do 
    headers = { "CONTENT_TYPE" => "application/json" }
    post "/notifications",
    :params => {
      notification: {
        phone: "1234567890",
        body: "My test Message",
      }
    }, :headers => headers

    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status(:unprocessable_entity)
  end
end