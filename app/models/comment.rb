class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user
  belongs_to :book

  field :caption, type: String

  validates :caption, presence: true, length: { minimum: 2 }
end
