class Request
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user
  belongs_to :book

  field :time_start, type: Date
  field :time_end, type: Date
  field :address, type: String
  field :status, type: String, default: "pending"
  field :phone_number, type: String

  validates :user, presence: true
  validates :book, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :time_start, presence: true
  validates :time_end, presence: true
  validates :status, presence: true, inclusion: { in: %w[pending accepted], message: "%{value} is not a valid status" }
  validate :time_start_must_be_before_time_end

  private

  def time_start_must_be_before_time_end
    if time_start.present? && time_end.present? && time_start >= time_end
      errors.add(:time_start, "must be before the end time")
    end
  end
end
