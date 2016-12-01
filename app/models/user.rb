class User < ApplicationRecord
  belongs_to :secret_santa, class_name: 'User', optional: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true, uniqueness: true
  validates :secret_santa, uniqueness: true, allow_blank: true

  scope :approved,  -> { where approved: true }
  scope :claimed,   -> { where taken: true }
  scope :unclaimed, -> { where taken: false }

  def approve!
    update! approved: true
  end

  def claim_for(user)
    update taken: true, secret_santa: user
  end

  def giftee
    User.find_by secret_santa: self
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
