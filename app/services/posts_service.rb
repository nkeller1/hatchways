class PostsService
  def connection
    Faraday.new(
      url: 'https://hatchways.io'
    )
  end

  def gather_posts_from_tags(tags)
    response = tags.map do |tag|
      connection.get('/api/assessment/blog/posts') do |req|
        req.params['tag'] = tag
      end
    end

    combine_posts(response)
  end

  def combine_posts(responses)
    allposts = Array.new

    responses.map do |rep|
      allposts << JSON.parse(rep.body)['posts']
      allposts
    end

    allposts.flatten.uniq
  end
end
