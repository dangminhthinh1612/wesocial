class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :user

  acts_as_notifiable :users,
    targets: ->(comment, key) {
      ([comment.commentable.user] + comment.commentable.commented_users.to_a - [comment.user]).uniq
    },
    notifiable_path: ->(comment, key) { "#{comment.commentable_notifiable_path}, #{key}" }

  private

  def commentable_notifiable_path
    polymorphic_path(comment)
  end
end
