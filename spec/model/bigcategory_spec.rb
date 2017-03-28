require 'rails_helper'

RSpec.describe Bigcategory, type: :model do

	describe 'validation' do
		it { should validate_presence_of(:name) }
	end

	describe 'association' do
		it { should have_many(:categori) }
	end
end
