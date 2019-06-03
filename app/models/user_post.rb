class UserPost < ApplicationRecord
  belongs_to :user

  has_many :comments, as: :commentable, dependent: :destroy
  has_many :commented_users, through: :comments, source: :user
end
