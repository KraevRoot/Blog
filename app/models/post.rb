class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :categories

  searchkick

  validates :title, presence: true
  validates :content, presence: true
  validates :user, presence: true
end
