require 'rails_helper'

RSpec.describe TransactionsController, type: :controller do

	before(:each) do
		current_user = nil
	end
	describe 'GET #new' do
		it 'assigns a new transactions to @transaction' do
			get :new
			expect(response).to be_success
			expect(response).to have_http_status(200)
			expect(assigns(:transaction)).to be_a_new(Transaction)
			expect(response).to render_template("new")
		end
	end

	describe 'POST #create' do
		let!(:valid_params) { Hash(transaction: { user_name: 'hongan', user_email: 'love@gmail.com', user_phone: '0906512162', user_address: 'QN' } )}
		let!(:invalid_params) { Hash(transaction: {user_name: 'andy', user_email: 'love@gmail.com', user_phone: '11111', user_address: 'QN'})}
		let!(:params) { Hash(transaction: { username: 'hongan94', user_email: 'test@gmail.com', user_phone: '0985471582', user_address: 'PT'})}

		def do_request(params)
			post :create, params
		end

		context 'success create transaction' do
			it 'render json with success message' do
				do_request(valid_params)
				expect{
					do_request(valid_params)
				}.to change(Transaction,:count).by(1)
				expect(flash[:notice]).to match("Bạn đã order thành công")
				expect(response).to redirect_to transactions_path
			end
		end

		context 'fail create transaction' do
			it 'render template new' do
				do_request(invalid_params)
				expect(response).to render_template("new")
			end
		end
	end
end
