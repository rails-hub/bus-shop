require Rails.root.join('app', 'uploaders', 'temp_uploader')
require 'securerandom'
require 'RMagick'

class TempUploaderController < ApplicationController

  def upload
    uploader = TempUploader.new
    uploader.store!(params[params[:qqfile]])
    @file = Hash.new
    @file[:file_name] = file_name_for_path(uploader.store_path)
    @file[:file_path] = uploader.store_path
    @file[:uploaded_for] = params[:upload_for]
    @file[:rand_token] = s = SecureRandom.urlsafe_base64(7)
    ext = uploader.store_path.split(".").last
    height = params[:demesions_height]
    width = params[:demesions_width]

    valid_photos = [
        "jpg",
        "jpeg",
        "gif",
        "png",
        "swf"
    ]

    is_demesion_vaild( width,height)

    if is_valid_file_for(valid_photos, uploader.file.content_type)
      @file[:type] = 'photo'
      @file[:success] = true
    else
      @file[:success] = false
      @file[:type] = 'unknown'
    end
    respond_to do |format|
      format.js { render json: @file }
    end
  end

  private
  def file_name_for_path(path)
    ext = path.split(".").last
    p = path.split("/").last
    p = p.split("_").first
    "#{p}.#{ext}"
  end

  def is_valid_file_for collection, content_type
    collection.each { |d| return true if content_type.include? d }
    false
  end

  def is_demesion_vaild width , height
    image = Magick::Image::read(@file).first
    7.times { |i| logger.debug "**#{  image.inspect if i == 4 }**" }
    raise "Error"
  end

end
