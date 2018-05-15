class Group < ApplicationRecord
  belongs_to :event, inverse_of: :groups

  has_many :assignments, inverse_of: :group, dependent: :destroy
  has_many :users, through: :assignments, source: :user, inverse_of: :groups

  validates :event, presence: true
end
