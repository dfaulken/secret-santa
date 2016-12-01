class UsersController < ApplicationController
  before_action :check_admin, only: %i(approve manage)
  before_action :find_user, only: %i(approve toggle_admin)

  def approve
    @user.approve!
    flash[:notice] = "#{@user.name} has been approved."
    redirect_back fallback_location: manage_users_path
  end

  def claim
    user = User.unclaimed.without(current_user).sample
    user.claim_for current_user
    flash[:notice] = "Your giftee is #{user.name}!"
    redirect_to root_path
  end

  def index
    @expected_count = CONFIG.fetch :user_count
    @registered = User.approved
    @claimed_count = User.claimed.count
    @giftee = current_user.giftee
  end

  def toggle_admin
    @user.toggle :admin
    if @user.save
      flash[:notice] = 
        if @user.admin?
          "#{@user.name} is now an administrator."
        else "#{@user.name} is no longer an administrator."
        end
    end
    redirect_back fallback_location: manage_users_path
  end

  def register
    user = User.new name: params.require(:name)
    if user.save
      flash[:notice] = "Welcome #{user.name}!"
    else flash[:error] = "Whoops! Looks like you've already signed up!"
    end
    redirect_to root_path
  end

  private

  def check_admin
    head :unauthorized unless current_user.admin?
  end

  def find_user
    @user = User.find_by id: params.require(:id)
  end

end
