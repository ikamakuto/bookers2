class Book < ApplicationRecord
    belongs_to :user
    validates :title, presence: true #titleカラムと
    validates :body, presence: true, length: { maximum: 200 } #bodyカラムは空白で投稿できない
end