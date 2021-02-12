class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :messages, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user

  with_options extend ActiveHash::Associations::ActiveRecordExtensions do
    belongs_to :place
    belongs_to :water_depth
    belongs_to :weather
    belongs_to :feed
  end

  def was_attached?
    image.attached?
  end

  validates :fishing_result, presence: true
  validates :title, presence: true, unless: :was_attached?

  with_options numericality: { other_than: 1 } do
    validates :place_id
    validates :water_depth_id
    validates :weather_id
    validates :feed_id
  end

  def self.sort(selection)
    case selection
    when 'fishing_result_desc'
      all.order(fishing_result: :DESC)
    when 'likes_count_desc'
      all.order(likes_count: :DESC)
    when 'created_at_desc'
      all.order(created_at: :DESC)
    when 'created_at_asc'
      all.order(created_at: :ASC)
    else
      all.order(created_at: :DESC)
    end
  end
end
