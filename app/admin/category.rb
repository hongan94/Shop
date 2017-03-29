ActiveAdmin.register Category do
	# Strong parameters trong Rails
	# cho phép Rails controllers nhận giá trị truyền từ views
	# Cho các thuộc tính được khai báo dưới đây
	permit_params :name, :description, :image, :bigcategory_id

	index do
		selectable_column
		id_column
		column :name
		column :image do |image|
			image_tag image.image, class: 'my_image_size'
		end
		column :description
		column :bigcategory_id do |big|
			Bigcategory.find(big.bigcategory)
		end
		# edit button view , edit , delete
		  # actions defaults: false do |post|
		  #   item "View", admin_category_path(post), class: 'action action_view', type: "button" do
				# 	fa_icon "camera-retro"
				# end
				# item "Edit", edit_admin_category_path(post), class: 'action action_edit'
				# item "Delete", admin_category_path(post), method: :delete, data: {confirm: "Are you sure ?"}, class: 'action action_delete'
		  # end
		actions
	end

	show do #hien thi o page show
		attributes_table do
			row :name
			row :image do |image|
				image_tag image.image, class: 'my_image_size'
			end
			row :description
			row :bigcategory
			row :created_at
			row :updated_at
		end
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
			f.input :image, input_html: { class: 'image' }
			if params[:id].present?
				category = Category.find(params[:id])
				if category.image.present?
					div class: 'preview_image' do
						image_tag(category.image ,height: 120, width: 180, id: "output")
					end
				else
					div class: 'hidden preview_image' do
						image_tag('' ,height: 120, width: 180, id: "output")
					end
				end
			else
				div class: 'hidden preview_image' do
					image_tag('' ,height: 120, width: 180, id: "output")
				end
			end
			f.input :description
			f.input :bigcategory_id, label: 'Bigcategory', as: :select, collection: Bigcategory.all, include_blank: false
		end
		f.actions
	end

end