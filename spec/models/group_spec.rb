require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :event }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :event }
  end
end
