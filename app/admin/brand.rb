ActiveAdmin.register Brand do
	# Strong parameters trong Rails
	# cho phép Rails controllers nhận giá trị truyền từ views
	# Cho các thuộc tính được khai báo dưới đây
	permit_params :name, :image


	index do
		selectable_column
		id_column
		column :name
		column :image do |image|
			image_tag image.image, class: 'my_image_size'
		end
		actions
	end

	show do #hien thi o page show
		attributes_table do
			row :name
			row :image do |image|
				image_tag image.image, class: 'my_image_size'
			end
			row :created_at
			row :updated_at
		end
	end

	action_item only: :show do #  them nut button cho page show
		link_to 'New Brand' ,new_admin_brand_path
	end

	# Cho phép admin search theo các thuộc tính này tại trang index
	filter :name
	# Các thuộc tính sẽ được hiển thị để Admin nhập giá trị
	form do |f|
		f.inputs " Brand Details" do
			f.input :name
			f.input :image
		end
		f.actions
	end

end