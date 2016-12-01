class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true, uniqueness: true

  scope :claimed,   -> { where taken: true }
  scope :unclaimed, -> { where taken: false }

  def approve!
    update! approved: true
  end

  def claim!
    update taken: true
  end

  # Require admins to approve users once they register.
  def active_for_authentication?
    super && approved?
  end

  def inactive_message
    if !approved? then :not_approved
    else super
    end
  end
end
