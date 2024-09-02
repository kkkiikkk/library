class Book
  include Mongoid::Document
  include Mongoid::Slug
  include Mongoid::Timestamps

  has_many :requests
  has_many :likes

  field :name, type: String
  field :description, type: String
  field :author, type: String
  field :status, type: String
  
  slug :name
  mount_uploader :image, ImageBookUploader

  validates :name, presence: true
  validates :image, presence: true
  validates :description, presence: true, length: { minimum: 50 }
  validates :author, presence: true
  validates :status, presence: true, inclusion: { in: %w[in out], message: "%{value} is not a valid status" }

  def likes_count
    likes.count
  end

  def average_rating
    likes.any? ? likes.avg(:rate) : 0
  end
end
