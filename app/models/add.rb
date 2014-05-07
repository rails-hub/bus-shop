class Add < ActiveRecord::Base
  mount_uploader :image , TempUploader
  belongs_to :client


  def self.image_type(add)
    image_path = add.image.to_s.split('.')
    return image_path[1]
  end
end
