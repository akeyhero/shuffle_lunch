require 'rails_helper'

RSpec.describe Assignment, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :group }
    it { is_expected.to belong_to :user }
  end

  describe 'validations' do
    subject { build :assignment }
    it { is_expected.to validate_presence_of :group }
    it { is_expected.to validate_presence_of :user }
    it { is_expected.to validate_uniqueness_of(:group_id).scoped_to :user_id }
  end
end
