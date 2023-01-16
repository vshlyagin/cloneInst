class Post < ApplicationRecord
    include ImageUploader::Attachment(:image)

    belongs_to :user

    validates :body, presence: true
    validates :image, presence: true
end
