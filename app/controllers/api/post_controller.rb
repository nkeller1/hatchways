class Api::PostController < ApplicationController
  def index
    connection = Faraday.new(
      url: 'https://hatchways.io'
    )

    # tags = params['tag'].split(',')
    tag = params['tag']
    sortBy = params['sortBy']
    direction = params['direction']

    response = connection.get('/api/assessment/blog/posts') do |req|
      req.params['tag'] = tag
    end

    response = JSON.parse(response.body)['posts']
      ordered_response = response.sort_by do |post|
        post[sortBy]
      end

    if direction == 'desc'
      ordered_response = ordered_response.reverse!
    end
    require "pry"; binding.pry
    render json: ordered_response
  end
end
