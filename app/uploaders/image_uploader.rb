require "image_processing/mini_magick"

class ImageUploader < Shrine

    plugin :derivatives
    
    Attacher.derivatives do |original|
        magick = ImageProcessing::MiniMagick.source(original)
        { 
            large: magick.resize_to_limit!(800, 800),
            medium: magick.resize_to_limit!(500, 500),
            small:  magick.resize_to_limit!(300, 300),
        }
        end

    Attacher.validate do
       validate_max_size 5.megabyte, message: "is too large (max is 5 MB)"
       validate_mime_type_inclusion ['image/jpg', 'image/jpeg', 'image/png']
    end
end