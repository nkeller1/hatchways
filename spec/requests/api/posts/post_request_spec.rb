require 'rails_helper'

RSpec.describe '/post route' do
  it "recieves a a successful response with a single tag param", :vcr do

    get '/api/posts?tag=tech'

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(response.headers["Content-Type"]).to eq("application/json; charset=utf-8")
  end

  it "recieves a a successful response with a two tags", :vcr do

    get '/api/posts?tag=tech,science'

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(response.headers["Content-Type"]).to eq("application/json; charset=utf-8")
  end

  it "recieves a a successful response with sortBy and direction=asc query Params", :vcr do

    get '/api/posts/?tag=tech&sortBy=likes&direction=asc'

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(response.headers["Content-Type"]).to eq("application/json; charset=utf-8")
  end

  it "recieves a a successful response with sortBy and direction=desc query Params", :vcr do

    get '/api/posts/?tag=tech&sortBy=likes&direction=desc'

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(response.headers["Content-Type"]).to eq("application/json; charset=utf-8")
  end

  it "returns a 400 if the tag param is nil", :vcr do

    get '/api/posts/'

    expect(response.status).to eq(400)
    expect(response.body).to include("{\"error\":\"Tags parameter is required\"}")
  end

  it "returns a 400 if direction is invalid", :vcr do

    get '/api/posts/?tag=tech&sortBy=likes&direction=APPLE'

    expect(response.status).to eq(400)
    expect(response.body).to include("{\"error\":\"sortBy parameter is invalid\"}")
  end

  it "returns a 400 if sortBy is invalid", :vcr do

    get '/api/posts/?tag=tech&sortBy=APPLE'

    expect(response.status).to eq(400)
    expect(response.body).to include("{\"error\":\"sortBy parameter is invalid\"}")
  end
end
