require 'rails_helper'

RSpec.describe Post, type: :model do
  it "is valid with valid attributes" do
    post = Post.new(title: "Test Post", body: "This is a test post.", liked: false)
    expect(post).to be_valid
  end

  it "is not valid without a title" do
    post = Post.new(body: "This is a test post.")
    expect(post).not_to be_valid
  end

  it "is not valid without body" do
    post = Post.new(title: "Test Post")
    expect(post).not_to be_valid
  end
end
