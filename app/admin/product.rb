ActiveAdmin.register Product do
	# Strong parameters trong Rails
	# cho phép Rails controllers nhận giá trị truyền từ views
	# Cho các thuộc tính được khai báo dưới đây
	permit_params :image, :name, :description, :price, :qty, :category_id, :brand_id, :discount

	index do
		selectable_column
		id_column
		column :name
		column :image do |image|
			image_tag image.image , class: 'my_image_size'
		end
		column :description
		column :price , class: 'color_red' do |price|
			number_to_currency(price.price, unit: "đ", precision: 0, format: "%n %u")
		end
		column :qty
		column :category_id do |cate|
			Category.find(cate.category)
		end
		column :brand_id do |br|
			Brand.find(br.brand) if br.brand.present?
		end
		column :discount
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

	show do #hien thi o page show
		attributes_table do
			row :name
			row :image do |image|
				image_tag image.image, class: 'my_image_size'
			end
			row :description
			row :price
			row :qty
			row :category_id do |cate|
				Category.find(cate.category)
			end
			row :brand_id do |br|
				Brand.find(br.brand) if br.brand.present?
			end
			row :discount
			row :created_at
			row :updated_at
		end
	end

	form do |f|
		f.inputs "Product Details" do
			f.input :name
			f.input :image, input_html: { class: 'image' }
			if params[:id].present?
				product = Product.find(params[:id])
				if product.image.present?
					div class: 'preview_image' do
						image_tag(product.image ,height: 120, width: 180, id: "output")
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
			f.input :price
			f.input :qty
			f.input :category_id, label: 'Category', as: :select, collection: Category.all, include_blank: false
			f.input :brand_id, label: 'Brand', as: :select, collection: Brand.all, include_blank: false
			f.input :discount
		end
		f.actions
	end

end