class User < ApplicationRecord
  has_many :participations, inverse_of: :user, dependent: :destroy
  has_many :events, through: :participations, source: :event, inverse_of: :users
  has_many :assignments, inverse_of: :user, dependent: :destroy
  has_many :groups, through: :assignments, source: :group, inverse_of: :users
  has_many :messages, inverse_of: :user, dependent: :destroy

  validates :nickname, presence: true, uniqueness: { case_sensitive: true }, length: { maximum: 255 }

  def group_on(event)
    groups.find { |group| group.event_id == event.id }
  end
end
