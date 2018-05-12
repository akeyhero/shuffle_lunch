class Event < ApplicationRecord
  has_many :participations, inverse_of: :event, dependent: :destroy
  has_many :users, through: :participations, source: :user, inverse_of: :events

  validates :title, length: { maximum: 255 }
  validates :description, length: { maximum: 65535 }
  validates :min_member, allow_blank: true, numericality: { only_integer: true, greater_than: 0 }
  validates :max_member, allow_blank: true, numericality: { only_integer: true, greater_than: 0 }
  validates :max_member, allow_blank: true, numericality: { greater_than_or_equal_to: :min_member, if: -> { min_member.present? } }
  validates :max_group_member, allow_blank: true, numericality: { only_integer: true, greater_than: 0 }
  validates :max_group_member, allow_blank: true, numericality: { less_than_or_equal_to: :max_member, if: -> { max_member.present? } }
end
