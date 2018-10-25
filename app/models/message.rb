class Message < ApplicationRecord
  belongs_to :group, inverse_of: :messages
  belongs_to :user,  inverse_of: :messages

  validates :group, presence: true
  validates :user,  presence: true
  validates :body,  presence: true, length: { maximum: 65535 }

  def as_chat_format
    as_json only: :body, include: { user: { only: :nickname } }
  end
end
