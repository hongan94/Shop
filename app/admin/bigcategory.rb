ActiveAdmin.register Bigcategory do
	# Strong parameters trong Rails
	# cho phép Rails controllers nhận giá trị truyền từ views
	# Cho các thuộc tính được khai báo dưới đây
	permit_params :name, :image


	index do
		selectable_column
		id_column
		column :name
		column :image
		actions
	end

	action_item only: :show do #  them nut button cho page show
		link_to 'New Bigcategory', new_admin_bigcategory_path
	end

	# Cho phép admin search theo các thuộc tính này tại trang index
	filter :name
	# Các thuộc tính sẽ được hiển thị để Admin nhập giá trị
	form do |f|
		f.inputs "Bigcategory Details" do
			f.input :name
			f.input :image
		end
		f.actions
	end

end