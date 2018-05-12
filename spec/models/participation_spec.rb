require 'rails_helper'

RSpec.describe Participation, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :event }
    it { is_expected.to belong_to :user }
  end

  describe 'validations' do
    subject { build :participation }
    it { is_expected.to validate_presence_of :event }
    it { is_expected.to validate_presence_of :user }
    it { is_expected.to validate_uniqueness_of(:event_id).scoped_to(:user_id) }
  end
end
