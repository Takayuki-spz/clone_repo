class Micropost < ApplicationRecord
  attr_accessor :study_time_hours, :study_time_minutes
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
  # validates :study_time_hours, presence: true
  # validates :study_time_minutes, presence: true
  def study_time
    "#{study_time_hours}時間 #{study_time_minutes}分"
  end
end
