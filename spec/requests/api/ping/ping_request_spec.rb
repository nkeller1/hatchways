require 'rails_helper'

RSpec.describe 'Ping the API' do
  it "recieves a 200OK request", :vcr do

    get '/api/ping'

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(response.headers["Content-Type"]).to eq("application/json; charset=utf-8")
    expect(response.body).to include("{\"success\":true}")
  end
end
