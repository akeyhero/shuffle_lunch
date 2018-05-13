class Group < ApplicationRecord
  belongs_to :event, inverse_of: :groups

  validates :event, presence: true
end
