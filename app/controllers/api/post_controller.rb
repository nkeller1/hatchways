class Api::PostController < ApplicationController
  def index
    connection = Faraday.new(
      url: 'https://hatchways.io'
    )

    tag = params['tag']
    sortBy = params['sortBy']
    direction = params['direction']

    response = connection.get('/api/assessment/blog/posts') do |req|
      req.params['tag'] = tag
      req.params['sortBy'] = sortBy
      req.params['diretion'] = direction
    end

    # require "pry"; binding.pry
    render json: response.body
  end
end
