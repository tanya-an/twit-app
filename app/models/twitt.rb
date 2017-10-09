class Twitt < ActiveRecord::Base

  belongs_to :user
  validates :user_id, :body, presence: true
  before_create :post_to_twitter
  mount_uploader :image, ImageUploader
 

  def post_to_twitter
  	if image?
    	user.twitter.update_with_media(body, File.new(image.current_path))
    else
    	user.twitter.update(body)
    end
  end


end
