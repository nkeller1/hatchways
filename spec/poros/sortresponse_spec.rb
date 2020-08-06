require 'rails_helper'


RSpec.describe Sortresponse do
  it "sort_response" do
    post1 = {
          "author": "Bryson Bowers",
          "authorId": 6,
          "id": 85,
          "likes": 25,
          "popularity": 0.18,
          "reads": 16861,
          "tags": [
              "tech"
          ]
      }

    post2 = {
          "author": "Ahmad Dunn",
          "authorId": 7,
          "id": 45,
          "likes": 31,
          "popularity": 0.89,
          "reads": 63432,
          "tags": [
              "science",
              "history"
          ]
      }

    post3 = {
        "author": "Jon Abbott",
        "authorId": 4,
        "id": 46,
        "likes": 89,
        "popularity": 0.96,
        "reads": 79298,
        "tags": [
            "culture",
            "tech"
        ]
    }

    response = [post1, post2, post3]
    sortBy = 'likes'
    direction = 'desc'

    sorted = Sortresponse.new.sort_response(response, sortBy, direction)

    expect(sorted.first).to be(post3)
    expect(sorted.first).not_to be(post1)
  end
end
