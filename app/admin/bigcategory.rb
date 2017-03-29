ActiveAdmin.register Bigcategory do
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
		link_to 'New Bigcategory', new_admin_bigcategory_path
	end

	# Cho phép admin search theo các thuộc tính này tại trang index
	filter :name
	# Các thuộc tính sẽ được hiển thị để Admin nhập giá trị
	form do |f|
		f.inputs "Bigcategory Details" do
			f.input :name
			f.input :image, input_html: { class: 'image' }
			bigcategory = Bigcategory.find(params[:id])
			if bigcategory.image.present?
				div class: 'preview_image' do
					image_tag(bigcategory.image ,height: 120, width: 180, id: "output")
				end
			else
				div class: 'hidden preview_image' do
					image_tag('' ,height: 120, width: 180, id: "output")
				end
			end
		end
		f.actions
	end

end