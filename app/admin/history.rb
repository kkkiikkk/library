ActiveAdmin.register Action do
  permit_params :book_id, :user_id

  index do
    selectable_column
    id_column
    column :user do |action|
      action.user.email if action.user
    end
    column :book do |action|
      action.book.name if action.book
    end
    column :created_at
    column :updated_at
    actions
  end

  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :user, as: :select, collection: User.all.map { |user| [user.email, user.id] }, include_blank: false
      f.input :book, as: :select, collection: Book.all.map { |book| [book.name, book.id] }, include_blank: false
    end
    f.actions
  end

  show do
    attributes_table do
      row :user do |action|
        action.user.email if action.user
      end
      row :book do |action|
        action.book.name if action.book
      end
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
end
