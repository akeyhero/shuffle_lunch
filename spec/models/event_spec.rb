require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'validations' do
    it { is_expected.to validate_length_of(:title).is_at_most 255 }
    it { is_expected.to validate_length_of(:description).is_at_most 65535 }
    it { is_expected.to validate_numericality_of(:min_member).only_integer }
    it { is_expected.to validate_numericality_of(:min_member).is_greater_than 0 }
    it { is_expected.to validate_numericality_of(:max_member).only_integer }
    it { is_expected.to validate_numericality_of(:max_member).is_greater_than 0 }
    it { is_expected.to validate_numericality_of(:max_group_member).only_integer }
    it { is_expected.to validate_numericality_of(:max_group_member).is_greater_than 0 }

    context 'without min_member nor max_member' do
      subject { build :event, min_member: nil, max_member: nil }
      it { is_expected.to be_valid }
    end

    context 'with min_member' do
      let(:min_member) { Faker::Number.between(1, 5) }
      subject { build :event, min_member: min_member, max_member: nil }
      it { is_expected.to validate_numericality_of(:max_member).is_greater_than_or_equal_to min_member }
    end

    context 'with max_member' do
      let(:max_member) { Faker::Number.between(2, 10) }
      subject { build :event, min_member: nil, max_member: max_member, max_group_member: nil }
      it { is_expected.to validate_numericality_of(:max_group_member).is_less_than_or_equal_to max_member }
    end
  end
end
