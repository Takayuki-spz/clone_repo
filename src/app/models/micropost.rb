class Micropost < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_one_attached :image do |attachable|
    attachable.variant :display, resize_to_limit: [500, 500]
  end
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validates :image,   content_type: { in: %w[image/jpeg image/gif image/png],
                                      message: "must be a valid image format" },
                              size: { less_than: 5.megabytes,
                                      message: "should be less than 5MB" }
                                      
  validates :study_time_hour, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 12 }, allow_nil: true
  validates :study_time_minute, inclusion: { in: [0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55] }, allow_nil: true


end
