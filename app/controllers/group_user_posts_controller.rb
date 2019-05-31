class GroupUserPostsController < ApplicationController
  def create
    @gup = GroupUserPost.create gup_params
  end

  private

  def gup_params
    params.require(:group_user_post).permit :user_id, :group_id, :content,
      :like_count, :taged_users, :file, :share_post_id, :approved,
      :share_to, :share_to_id
  end
end
