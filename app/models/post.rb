class Post < ApplicationRecord
  belongs_to :author, class_name: "User"
  has_many :comments, dependent: :destroy

  validates :title, :body, presence: true
  validates :title, uniqueness: true
end
