class Like
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user
  belongs_to :book

  field :rate, type: Integer

  validates :user, presence: true, uniqueness: { scope: :book, message: "has already liked this book" }
  validates :book, presence: true
  validates :rate, presence: true, inclusion: { in: 1..5, message: "must be between 1 and 5" }
end
