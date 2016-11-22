class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  scope :claimed,   -> { where taken: true }
  scope :unclaimed, -> { where taken: false }

  def claim!
    update taken: true
  end
end
