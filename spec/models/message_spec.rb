require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :group }
    it { is_expected.to belong_to :user }
  end

  describe 'validations' do
    subject { build :message }
    it { is_expected.to validate_presence_of :group }
    it { is_expected.to validate_presence_of :user }
    it { is_expected.to validate_presence_of :body }
    it { is_expected.to validate_length_of(:body).is_at_most 65535 }
  end
end
