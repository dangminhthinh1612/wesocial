class GroupUser < ApplicationRecord
  belongs_to :user
  belongs_to :group

  enum role: [:user, :editor, :admin]
end
