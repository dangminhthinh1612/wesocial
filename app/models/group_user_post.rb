class GroupUserPost < ApplicationRecord
  belongs_to :user
  belongs_to :group

  has_many :comments, as: :commentable, dependent: :destroy

  validates :content, presence: true
end
