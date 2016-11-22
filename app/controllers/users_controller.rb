class UsersController < ApplicationController
  def claim
    user = User.unclaimed.sample
    user.claim!
    render json: { name: user.name }
  end

  def index
    @expected_count = CONFIG.fetch :user_count
    @registered_count = User.count
    @claimed_count = User.claimed.count
  end

  def register
    user = User.new name: params.require(:name)
    if user.save
      flash[:notice] = "Welcome #{user.name}!"
    else flash[:error] = "Whoops! Looks like you've already signed up!"
    end
    redirect_to users_path
  end
end
