class Post < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  # validates :liked, presence: true
end
