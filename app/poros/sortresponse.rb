class Sortresponse

  def sort_response(response, sortBy, direction)
    ordered_response = response.sort_by do |post|
      post[sortBy]
    end

    if direction == 'desc'
      ordered_response = ordered_response.reverse!
    end
  end
end
