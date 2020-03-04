require 'rails_helper'

RSpec.describe Olympian, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name}
  end

  describe 'relationships' do
    it { should have_many :olympians }
    it { should have_many :events }
  end
end
