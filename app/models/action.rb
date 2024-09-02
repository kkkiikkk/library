class Action
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :book
  belongs_to :user

  field :user_id, type: BSON::ObjectId
  field :book_id, type: BSON::ObjectId
end
