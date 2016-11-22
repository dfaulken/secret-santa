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
    if User.create name: params.require(:name)
      head :ok
    else head :unprocessable_entity
    end
  end
end
