class GroupsController < ApplicationController
  def show
    @group = Group.find_by id: params[:id]
    @group_user_post = GroupUserPost.new
    @gups = @group.group_user_posts.order(created_at: "DESC")
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new group_params
    if @group.save
      @group.group_users.create(role: "admin", user_id: current_user.id)
      flash[:success] = "#{I18n.t "create_group_success"}"
      redirect_to group_path @group
    else
      render :new
    end
  end

  def statistics
    @group = Group.find_by id: params[:id]
  end

  private

  def group_params
    params.require(:group).permit :name, :description, :privacy, :address,
    :cover, :email, :website, :phone, :facebook, :twitter, :instagram
  end
end
