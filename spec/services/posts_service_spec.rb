require 'rails_helper'

RSpec.describe PostsService do
  it "gather_posts_from_tags", :vcr do
    tags1 = ['tech']
    service1 = PostsService.new.gather_posts_from_tags(tags1)

    expect(service1).to be_a Array
    expect(service1.length).to eq(28)

    tags2 = ['tech', 'science']
    service2 = PostsService.new.gather_posts_from_tags(tags2)

    expect(service2).to be_a Array
    expect(service2.length).to eq(49)
  end
end
