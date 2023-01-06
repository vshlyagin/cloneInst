class Post < ApplicationRecord
    include ImageUploader::Attachment(:image)

    validates :body, presence: true
    validates :image, presence: true
end
