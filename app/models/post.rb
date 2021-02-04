class Post < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  with_options extend ActiveHash::Associations::ActiveRecordExtensions do
    belongs_to :place
    belongs_to :water_depth
    belongs_to :weather
    belongs_to :feed
  end

  validates :fishing_result, presence: true
  validates :title, presence: true, unless: :was_attached?
  def was_attached?
    self.image.attached?
  end

  with_options numericality: { other_than: 1 } do
    validates :place_id
    validates :water_depth_id
    validates :weather_id  
    validates :feed_id 
   end
  

end
