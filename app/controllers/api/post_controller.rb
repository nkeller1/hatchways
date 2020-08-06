class Api::PostController < ApplicationController
  def index
    return render json: no_tag_present if params['tag'].nil?

    tags = params['tag'].split(",")
    sortBy = params['sortBy']
    direction = params['direction']

    allowed_sort_params = ['id', 'likes', 'popularity', 'reads', nil]
    allowed_direction_params = [nil, 'asc', 'desc']

    return render json: sort_params_invalid if allowed_direction_params.include?(direction) == false
    return render json: sort_params_invalid if allowed_sort_params.include?(sortBy) == false

    connection = Faraday.new(
      url: 'https://hatchways.io'
    )
    
    response = tags.map do |tag|
      connection.get('/api/assessment/blog/posts') do |req|
        req.params['tag'] = tag
      end
    end

    allposts = Array.new

    response.map do |rep|
      allposts << JSON.parse(rep.body)['posts']
      allposts
    end

    response = allposts.flatten.uniq

      ordered_response = response.sort_by do |post|
        post[sortBy]
      end

    if direction == 'desc'
      ordered_response = ordered_response.reverse!
    end

    render json: { 'posts': ordered_response }
  end

  private

    def no_tag_present
      response.status = 400
      response.body = { 'error': 'Tags parameter is required' }
    end

    def sort_params_invalid
      response.status = 400
      response.body = { 'error': 'sortBy parameter is invalid' }
    end
end
