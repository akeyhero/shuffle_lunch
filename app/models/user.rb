class User < ApplicationRecord
  has_many :participations, inverse_of: :user, dependent: :destroy
  has_many :events, through: :participations, source: :event, inverse_of: :users

  validates :nickname, presence: true, uniqueness: { case_sensitive: true }, length: { maximum: 255 }
end
