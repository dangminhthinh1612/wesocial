class GroupUserPost < ApplicationRecord
  belongs_to :user
  belongs_to :group

  has_many :comments, as: :commentable, dependent: :destroy
  has_many :commented_users, through: :comments, source: :user
end
