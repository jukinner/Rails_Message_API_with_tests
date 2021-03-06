require 'rails_helper'

RSpec.describe Notification, type: :model do
  describe 'creation' do
    it 'can be created' do
      client = Client.create(source_app: 'my_app', api_key: "7vGXTs1LMdeNbd63UdS2UAtt")
      notification = FactoryBot.build_stubbed(:notification)
      expect(notification).to be_valid
    end
  end

  describe 'validations' do 
    before { @notification = FactoryBot.build_stubbed(:notification) }

    it 'can be created if valid' do
      @notification.phone = nil
      @notification.body = nil
      @notification.source_app = nil
      expect(@notification).to_not be_valid
    end

    it 'requires the phone attribute to contain a string of integers' do
      @notification.phone = "atextphonenumber"
      expect(@notification).to_not be_valid
    end

    it 'requires the phone attribute to only have 10 characters' do 
      @notification.phone = "12345678912"
      expect(@notification).to_not be_valid
    end

    it 'limits the body attribute to 160 characters' do 
      @notification.body = "word" * 500
      expect(@notification).to_not be_valid
    end
  end

  describe 'relationship' do
    it 'has a connection to a client based on the source_app attribute' do 
      client = Client.create(source_app: 'my_app', api_key: "7vGXTs1LMdeNbd63UdS2UAtt")
      notification = client.notifications.create!(phone: '9999999999', body: 'message content')
      expect(notification.source_app).to eq('my_app')
    end
  end
end
