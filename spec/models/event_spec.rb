require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'validations' do
    it { is_expected.to validate_length_of(:title).is_at_most 255 }
    it { is_expected.to validate_length_of(:description).is_at_most 65535 }
    it { is_expected.to validate_numericality_of(:min_member).only_integer }
    it { is_expected.to validate_numericality_of(:min_member).is_greater_than 0 }
    it { is_expected.to validate_numericality_of(:max_member).only_integer }
    it { is_expected.to validate_numericality_of(:max_member).is_greater_than 0 }
    xit { is_expected.to validate_numericality_of(:max_member).is_greater_than_or_equal_to :min_member }
    it { is_expected.to validate_numericality_of(:max_group_member).only_integer }
    it { is_expected.to validate_numericality_of(:max_group_member).is_greater_than 0 }
    xit { is_expected.to validate_numericality_of(:max_group_member).is_greater_than_or_equal_to :max_member }
  end
end
