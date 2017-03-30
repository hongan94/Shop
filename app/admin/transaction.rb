ActiveAdmin.register Transaction do
	# Strong parameters trong Rails
	# cho phép Rails controllers nhận giá trị truyền từ views
	# Cho các thuộc tính được khai báo dưới đây
	permit_params :name, :image


	index do
		selectable_column
		id_column
		column :user_name
		column :user_email
		column :user_phone
		column :amount, class: "color_red" do |amount|
			number_to_currency(amount.amount, unit: "đ", precision: 0, format: "%n %u")
		end
		column :payment
		column :payment_info
		column :message
		column :status
		actions
	end


	show do #hien thi o page show
		attributes_table do
			row :user_name
			row :user_email
			row :user_phone
			row :amount
			row :payment
			row :payment_info
			row :message
			row :status
		end
	end

	# Cho phép admin search theo các thuộc tính này tại trang index
	filter :user_name
	filter :user_email
	filter :amount
	filter :phone
	# Các thuộc tính sẽ được hiển thị để Admin nhập giá trị
	form do |f|
		f.inputs "Transaction Details" do
			f.input :user_name
			f.input :user_email
			f.input :user_phone
			f.input :amount
			f.input :message
		end
		f.actions
	end

end