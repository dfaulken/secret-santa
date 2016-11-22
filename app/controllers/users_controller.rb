class UsersController < ApplicationController
  def claim
    user = User.unclaimed.sample
    user.claim!
    render json: { name: user.name }
  end

  def index
    @registered_count = User.count
    @claimed_count = User.claimed.count
    @expected_count = CONFIG.fetch :user_count
  end

  def register
    User.create name: params.require(:name)
    render json: { count: User.count }
  end
end
