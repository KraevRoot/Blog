class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates :content, presence: true
  validates :post, presence: true
  validates :user, presence: true
end
