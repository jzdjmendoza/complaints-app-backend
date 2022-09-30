ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :email, :password, :first_name, :middle_name, :last_name, :type, :contact_number, :city, :barangay
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :first_name, :middle_name, :last_name, :type, :contact_number, :reset_password_token, :reset_password_sent_at, :remember_created_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  filter :id
  filter :email
  filter :first_name
  filter :middle_name
  filter :last_name
  filter :type
  filter :created_at
  filter :updated_at

  scope 'All', default: true do |f|
    f
  end

  scope('Responder') { |scope| scope.where(type: 'Users::Responder') }
  scope('Complainant') { |scope| scope.where(type: 'Users::Complainant') }

  index do
    id_column
    column :name do |data|
      data.name
    end
    column :email
    column :type
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :name do |data|
        data.name
      end
      row :email
      row :type
      row :contact_number
      row :city
      row :barangay
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs 'User Detail' do
      f.input :email
      f.input :password
      f.input :first_name
      f.input :middle_name
      f.input :last_name
      f.input :type, as: :select, collection: User.type.values
      f.input :contact_number
      f.input :city, as: :select, collection: Pilipinas::City.all.map{|a| a.name}
      f.input :barangay, as: :select, collection: Pilipinas::Barangay.all.map{|a| a.name}
    end
    f.actions
  end

  controller do
    def update
      user = params[:user]
      user.delete('password') if user[:password].blank?
      super
    end
  end
  
end
