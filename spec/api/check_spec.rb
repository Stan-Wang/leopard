require 'rails_helper'

describe Api::Check do
  context 'GET /api/echo' do
    it 'should return 200 and echo val data' do
      get '/api/echo?val=soPMed7mQxeapdMA8ASxRTaCBg89SQeP'
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)["val"]).to eq("soPMed7mQxeapdMA8ASxRTaCBg89SQeP")
    end
  end
end