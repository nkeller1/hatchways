require 'rails_helper'

RSpec.describe '/post route' do
  it "recieves a a successful response with a single tag param", :vcr do

    get '/api/posts?tag=tech'

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(response.headers["Content-Type"]).to eq("application/json; charset=utf-8")
  end
end
