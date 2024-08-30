ActiveAdmin.register Book do
  permit_params :name, :image, :description, :author, :status
  index do    
    column :author
    column :name
    column :image
    column :description
    column :status
    column :created_at
    actions
  end
end