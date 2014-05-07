class Image < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  belongs_to :bus
  mount_uploader :image, ImageUploader
  
  def image=(val)
    if !val.is_a?(String) && valid?
      image_will_change!
      super
    end
  end
  
  def to_jq_upload
    {
    "name"          => read_attribute(:image),
    "id"            => id,
    "size"          => image.size,
    "url"           => image.url,
    "thumbnail_url" => image.thumb.url,
    "delete_url"    => admin_image_path(:id => id),
    "delete_type"   => "DELETE" 
    }
  end
   
end
