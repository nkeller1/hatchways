require 'rails_helper'

RSpec.describe 'Ping the Hatchways API' do
  it "recieves a 200OK request", :vcr do

    get '/api/ping'

    expect(response).to be_successful
    expect(response.headers["Content-Type"]).to eq("application/json; charset=utf-8")
  end
end
