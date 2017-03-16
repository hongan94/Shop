ActiveAdmin.register Product do
	# Strong parameters trong Rails
	# cho phép Rails controllers nhận giá trị truyền từ views
	# Cho các thuộc tính được khai báo dưới đây
	permit_params :image, :name, :description, :price, :qty, :category_id

	index do
		selectable_column
		id_column
		column :name
		column :image
		column :description
		column :price
		column :qty
		column :category_id
		actions
	end

	action_item only: :show do #  them nut button cho page show
		link_to 'New Product', new_admin_product_path
	end
	# Cho phép admin search theo các thuộc tính này tại trang index
	filter :name
	filter :price
	filter :qty
	# Các thuộc tính sẽ được hiển thị để Admin nhập giá trị
	form do |f|
		f.inputs "Product Details" do
			f.input :name
			f.input :image
			f.input :description
			f.input :price
			f.input :qty
			f.input :category_id, label: 'Category', as: :select, collection: Category.all, include_blank: false
		end
		f.actions
	end

end