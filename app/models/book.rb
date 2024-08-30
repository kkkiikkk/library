class Book
  include Mongoid::Document
  include Mongoid::Slug
  field :name, type: String
  field :image, type: String
  field :description, type: String
  field :author, type: String
  field :status, type: String
  slug :name

  include Mongoid::Timestamps

  validates :name, presence: true
  validates :image, presence: true
  validates :description, presence: true, length: { minimum: 50 }
  validates :author, presence: true
  validates :status, presence: true, inclusion: { in: %w[in out], message: "%{value} is not a valid status" }
end
