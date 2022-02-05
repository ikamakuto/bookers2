class Book < ApplicationRecord
    attachment :profile_image
    belongs_to :user
end
