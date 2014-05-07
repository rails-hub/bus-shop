# encoding: utf-8
class TempUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick

  storage :file

  include CarrierWave::MimeTypes

  process :set_content_type

  IMAGE_EXTENSIONS = %w(jpg jpeg gif png)


  def store_dir
    "uploads/add/#{Date.current.to_s}/"
  end

  def self.process_extensions(*args)
    extensions = args.shift
    args.each do |arg|
      if arg.is_a?(Hash)
        arg.each do |method, args|
          processors.push([:process_trampoline, [extensions, method, args]])
        end
      else
        processors.push([:process_trampoline, [extensions, arg, []]])
      end
    end
  end

  # our trampoline method which only performs processing if the extension matches
  def process_trampoline(extensions, method, args)
    extension = File.extname(original_filename).downcase
    extension = extension[1..-1] if extension[0, 1] == '.'
    self.send(method, *args) if extensions.include?(extension)
  end

  #version :encode, :if => :not_doc? do
  #  process_extensions VIDEO_EXTENSIONS, :encode_video
  #end
  #
  #version :thumb, :if => :not_doc? do
  #  process_extensions IMAGE_EXTENSIONS, :resize_to_fit => [100, 70]
  #  process_extensions VIDEO_EXTENSIONS, :gen_video_thumb => [100, 70]
  #  process_extensions VIDEO_EXTENSIONS, :convert => 'png'
  #end


  def extension_white_list
    IMAGE_EXTENSIONS
  end

  def filename
    "#{original_filename.split('.').first}_#{secure_token}.#{file.extension}" if original_filename
  end

  protected
  def secure_token(length=16)
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.hex(length/2))
  end

  def not_doc?(new_file)
    !(TempUploader::DOCUMENT_EXTENSIONS.include?(new_file.file.split(".").last))
  end


end
