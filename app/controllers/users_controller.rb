class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @user = User.find(current_user.id)
  end
  
  def show
    @user = User.find(params[:id])
    @following = @user.followings
    @follower = @user.followers
    render template: "relationships/_follow_button"
  end

end
