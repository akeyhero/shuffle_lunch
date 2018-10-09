class Message < ApplicationRecord
  belongs_to :group, inverse_of: :messages
  belongs_to :user,  inverse_of: :messages

  validates :group, presence: true
  validates :user,  presence: true
  validates :body,  presence: true, length: { maximum: 65535 }
end
