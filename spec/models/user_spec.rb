require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    subject { build :user }
    it { is_expected.to validate_presence_of :nickname }
    it { is_expected.to validate_length_of(:nickname).is_at_most 255 }
    it { is_expected.to validate_uniqueness_of(:nickname) }
  end
end
