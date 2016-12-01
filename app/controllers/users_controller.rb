class UsersController < ApplicationController
  before_action :check_admin, only: %i(approve manage)
  before_action :find_user, only: %i(approve toggle_admin)

  def approve
    @user.approve!
    flash[:notice] = "#{@user.name} has been approved."
    redirect_to :back
  end

  def claim
    user = User.unclaimed.without(current_user).sample
    user.claim!
    flash[:notice] = <<-NOTICE.strip_heredoc
      Your giftee is #{user.name}!
      Be sure to write their name down,
      or we'll have to reset the whole thing.
      This is not exactly a robust system.
    NOTICE
    redirect_to root_path
  end

  def index
    @expected_count = CONFIG.fetch :user_count
    @registered = User.approved
    @claimed_count = User.claimed.count
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
    redirect_to :back
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
