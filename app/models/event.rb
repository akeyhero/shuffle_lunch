class Event < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :venue, length: { maximum: 255 }
  validates :description, length: { maximum: 65535 }
  validates :min_member, allow_blank: true, numericality: { only_integer: true, greater_than: 0 }
  validates :max_member, allow_blank: true, numericality: { only_integer: true, greater_than_or_equal_to: :min_member }
end
