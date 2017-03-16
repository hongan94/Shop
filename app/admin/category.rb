ActiveAdmin.register Category do
	# Strong parameters trong Rails
	# cho phép Rails controllers nhận giá trị truyền từ views
	# Cho các thuộc tính được khai báo dưới đây
	permit_params :name, :description, :image, :bigcategory_id

	index do
		selectable_column
		id_column
		column :name
		column :image
		column :description
		column :bigcategory_id
		actions
	end

	action_item only: :show do #  them nut button cho page show
		link_to 'New Category', new_admin_category_path
	end

	# Cho phép admin search theo các thuộc tính này tại trang index
	filter :name

	# Các thuộc tính sẽ được hiển thị để Admin nhập giá trị
	form do |f|
		f.inputs "Category Details" do
			f.input :name
			f.input :image
			f.input :description
			f.input :bigcategory_id, label: 'Bigcategory', as: :select, collection: Bigcategory.all, include_blank: false
		end
		f.actions
	end

end