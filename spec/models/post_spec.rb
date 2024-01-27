require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'validations' do

    it 'requires title' do
      post = Post.new(body: 'Some content', liked: false)
      expect(post).to_not be_valid
      expect(post.errors[:title]).to include("can't be blank")
    end

    it 'requires body' do
      post = Post.new(title: 'Some title', liked: false)
      expect(post).to_not be_valid
      expect(post.errors[:body]).to include("can't be blank")
    end

    it 'is valid with title, body and author all together' do
      post = Post.new(title: 'Some title', body: 'Some content', liked: true)
      expect(post).to be_valid
    end

  end
end
