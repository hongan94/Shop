require 'rails_helper'

RSpec.describe Transaction, type: :model do

  describe 'scope' do
		context 'get transaction have value > 1000000' do
      let!(:transaction) { create(:transaction, amount: 500000)}
			let!(:transaction1) { create(:transaction, amount: 1000000)}
			let!(:transaction2) { create(:transaction, amount: 1500000)}

			it ' should return amount >= 1000000' do
				expect(Transaction.get_transaction).to match [transaction1, transaction2]
			end
		end

		context 'get transaction not value > 1000000' do
			let!(:transaction) { create(:transaction, amount: 500000)}
			let!(:transaction1) { create(:transaction, amount: 100000)}
			let!(:transaction2) { create(:transaction, amount: 150000)}

			it ' should return is nil' do
				expect(Transaction.get_transaction).to match []
			end
		end
	end

	describe 'association' do
		it { should belong_to(:user) }
		it { should have_many(:orders) }
	end

	describe 'validation' do
		it { should validate_presence_of(:user_name) }
		it { should validate_presence_of(:user_email) }
		it { should validate_presence_of(:user_address)}
		it { should validate_presence_of(:payment)}
	end
end
