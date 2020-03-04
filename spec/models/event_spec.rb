require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'validations' do
    it { should validate_presence_of :games }
    it { should validate_presence_of :event }
  end

  describe 'relationships' do
    it { should have_many :olympians }
    it { should belong_to :sport }
  end
end
