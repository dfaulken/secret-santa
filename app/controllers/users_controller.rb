class UsersController < ApplicationController
  before_action :check_admin, only: :destroy

  def claim
    user = User.unclaimed.sample
    user.claim!
    flash[:notice] = <<-NOTICE.strip_heredoc
      Your giftee is #{user.name}!
      Be sure to write their name down,
      or we'll have to reset the whole thing.
      This is not exactly a robust system.
    NOTICE
    redirect_to root_path
  end

  def destroy
    user = User.find params.require(:id)
    user.destroy!
    flash[:notice] = "#{user.name} has been removed."
    redirect_to root_path
  end

  def index
    @expected_count = CONFIG.fetch :user_count
    @registered_count = User.count
    @claimed_count = User.claimed.count
  end

  def manage
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

  def check_admin_password
    head :unauthorized unless current_user.admin?
  end

end
