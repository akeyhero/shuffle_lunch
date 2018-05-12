class User < ApplicationRecord
  validates :nickname, presence: true, uniqueness: { case_sensitive: true }, length: { maximum: 255 }
end
