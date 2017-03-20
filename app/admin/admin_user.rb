ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation, :name
	
  index do
    selectable_column
    id_column
		column :name
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
	end

  filter :name
  filter :email
  filter :created_at

  show do #hien thi o page show
    attributes_table do
      row :id
      row :name
      row :email
			row :created_at
			row :updated_at
    end
	end

  action_item only: :show do #  them nut button cho page show
    link_to 'Add New', new_admin_admin_user_path
	end

  form do |f|
    f.inputs "Admin Details" do
			f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
