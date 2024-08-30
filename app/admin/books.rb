ActiveAdmin.register Book do
  permit_params :name, :image, :description, :author, :status

  index do
    selectable_column
    id_column
    column :name
    column :image do |book|
      image_tag book.image.url(:thumb)
    end
    column :description
    column :status
    actions
  end

  show do
    attributes_table do
      row :name
      row :image do |book|
        if book.image.present?
          image_tag book.image.url
        else
          "No Image"
        end
      end
      row :description
      row :author
      row :status
    end
  end

  form do |f|
    f.inputs "Book Details" do
      f.input :name
      f.input :image, as: :file, hint: f.object.image.present? ? image_tag(f.object.image.url(:thumb)) : content_tag(:span, "No Image Yet")
      f.input :description
      f.input :author
      f.input :status, as: :select, collection: %w[in out]
    end
    f.actions
  end
end
