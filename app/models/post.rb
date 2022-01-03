class Post < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { minimum: 2, maximum: 15 }
  validates :text, presence: true, length: { minimum: 2, maximum: 60 }
end
