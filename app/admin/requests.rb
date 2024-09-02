ActiveAdmin.register Request do
  permit_params :time_start, :time_end, :address, :status, :user_id, :book_id

  index do
    selectable_column
    id_column

    column(:user) { |request| request.user ? request.user.email : 'N/A' }
    column(:book) { |request| request.book ? request.book.name : 'N/A' }

    column :time_start
    column :time_end
    column :address
    column :status
    column :created_at
    actions
  end

  filter :user, as: :select, collection: -> { User.all.collect { |user| [user.email, user.id] } }
  filter :book, as: :select, collection: -> { Book.all.collect { |book| [book.name, book.id] } }
  filter :time_start
  filter :time_end
  filter :created_at

  form do |f|
    f.inputs do
      f.input :user, as: :select, collection: User.all.collect { |user| [user.email, user.id] }
      f.input :book, as: :select, collection: Book.all.collect { |book| [book.name, book.id] }
      f.input :time_start, as: :datepicker
      f.input :time_end, as: :datepicker
      f.input :address
      f.input :status, as: :select, collection: ['pending', 'accepted', 'failed']
    end
    f.actions
  end

  show do
    attributes_table do
      row :user
      row :book
      row :time_start
      row :time_end
      row :address
      row :status
      row :created_at
      row :updated_at
    end
  end
end
