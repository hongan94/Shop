ActiveAdmin.register Order do
	# Strong parameters trong Rails
	# cho phép Rails controllers nhận giá trị truyền từ views
	# Cho các thuộc tính được khai báo dưới đây
	permit_params :name, :image


	index do
		selectable_column
		id_column
		column :transaction_id
		column :product_id
		column :qty
		column :amount
		column :data
		column :status
		actions
	end


	show do #hien thi o page show
		attributes_table do
			row :transaction_id
			row :product_id
			row :qty
			row :amount
			row :data
			row :status
		end
	end

	# Cho phép admin search theo các thuộc tính này tại trang index
	filter :transaction_id
	filter :product_id
	filter :amount
	filter :qty
	filter :status
	# Các thuộc tính sẽ được hiển thị để Admin nhập giá trị
	form do |f|
		f.inputs "Transaction Details" do
			f.input :transaction_id
			f.input :product_id
			f.input :amount
			f.input :qty
			f.input :status
			f.input :data
		end
		f.actions
	end

end