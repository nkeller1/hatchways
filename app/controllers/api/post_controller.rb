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

    response = PostsService.new.gather_posts_from_tags(tags)

    sorted_response = Sortresponse.new.sort_response(response, sortBy, direction)

    render json: { 'posts': sorted_response }
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
