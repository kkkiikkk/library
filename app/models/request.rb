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
  field :confirmed, type: Boolean, default: false

  validates :user, presence: true
  validates :book, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :time_start, presence: true
  validates :time_end, presence: true
  validates :status, presence: true, inclusion: { in: %w[pending accepted failed], message: "%{value} is not a valid status" }
  validate :time_start_must_be_before_time_end

  after_update :send_status_change_email, if: :status_changed?

  private

  def time_start_must_be_before_time_end
    if time_start.present? && time_end.present? && time_start >= time_end
      errors.add(:time_start, "must be before the end time")
    end
  end

  def send_status_change_email
    case status
    when 'accepted'
      RequestMailer.request_accepted(id).deliver_now
      book.update(status: 'out')
      Action.create(book: book, user: user)
    when 'failed'
      RequestMailer.request_failed(id).deliver_now
    end
  end
end
