class Participation < ApplicationRecord
  belongs_to :event, inverse_of: :participations
  belongs_to :user,  inverse_of: :participations

  validates :event, presence: true
  validates :user,  presence: true
  validates :event_id, uniqueness: { scope: :user_id }
end
