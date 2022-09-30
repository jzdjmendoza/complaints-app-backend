ActiveAdmin.register Complaint do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :body, :subject, :complainant_id, :status, :city, :barangay

  filter :id
  filter :complainant_id
  filter :responder_id
  filter :created_at
  filter :updated_at

  index do
    id_column
    column :body
    column :subject
    column :status
    column :complainant
    column :responder
    column :city
    column :barangay
    actions
  end

  show do
    attributes_table do
      row :id
      row :subject
      row :body
      row :status
      row :complainant
      row :responder
      row :city
      row :barangay
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs 'Complaint Detail' do
      f.input :body
      f.input :subject
      f.input :status, as: :select, collection: Complaint.status.values
      f.input :complainant, as: :select, collection: Users::Complainant.all, include_blank: false
      f.input :city, as: :select, collection: Users::Responder.pluck(:city).uniq
      f.input :barangay, as: :select, collection: Users::Responder.pluck(:barangay).uniq
    end
    f.actions
  end
end
