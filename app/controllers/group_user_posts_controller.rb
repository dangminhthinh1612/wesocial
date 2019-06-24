class GroupUserPostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :load_group
  before_action :correct_user, only: :destroy

  def create
    @group_user_post = current_user.group_user_posts.build group_user_post_params.merge(user_id: current_user.id)
    if @group_user_post.save
      flash[:success] = I18n.t"post_suc"
      redirect_to group_path @group
    else
      render "groups/show"
    end
  end

  def destroy
    @group_user_post.destroy
    flash[:success] = I18n.t"post_del_suc"
    redirect_to request.referrer || root_url
  end

  private

  def group_user_post_params
    params.require(:group_user_post).permit(:content, :like_count, :integer,
      :taged_users, :shared_count, :file, :share_post_id, :share_to,
      :share_to_id, :approved, :group_id)
  end

  def load_group
    @group = Group.find_by id: params[:group_user_post][:group_id]
  end

  def correct_user
    @group_user_post = current_user.group_user_posts.find_by(id: params[:id])
    redirect_to group_path() if @group_user_post.nil?
  end
end
