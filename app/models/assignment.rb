class Assignment < ApplicationRecord
  belongs_to :group, inverse_of: :assignments
  belongs_to :user,  inverse_of: :assignments

  validates :group, presence: true
  validates :user,  presence: true
  validates :group_id, uniqueness: { scope: :user_id }
end
