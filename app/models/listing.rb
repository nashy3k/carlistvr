class Listing < ActiveRecord::Base
  # attr_accessible :picture #, :picture_cache, :remove_picture
  # attr_accessor :picture
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  mount_uploader :pic_bonnet, PictureUploader
  mount_uploader :pic_boot, PictureUploader
  validates :user_id, presence: true
  validates :cartype, presence: true, length: { maximum: 140 }
  validate :picture_size

  
  private

  	# Validates the size of an uploaded picture.
  	def picture_size
  		if picture.size > 1.megabyte
  			errors.add(:picture, "should be less than 1MB")
  		end
  	end
end
