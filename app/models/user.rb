class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true, uniqueness: true

  scope :claimed,   -> { where taken: true }
  scope :unclaimed, -> { where taken: false }

  def claim!
    update taken: true
  end
end
