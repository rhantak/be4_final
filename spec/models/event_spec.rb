require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'validations' do
    it { should validate_presence_of :games }
    it { should validate_presence_of :event }
    it { should validate_presence_of :medal }
  end

  describe 'relationships' do
    it { should belong_to :olympian }
  end
end
