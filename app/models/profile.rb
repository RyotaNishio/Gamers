class Profile < ApplicationRecord
  belongs_to :user
  
  has_one_attached :image
  
  def get_profile_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      image.attach(io:File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
end
