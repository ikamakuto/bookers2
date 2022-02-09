class Book < ApplicationRecord
    attachment :profileimage
    belongs_to :user
end
