class Blog < ApplicationRecord
    belongs_to :user   #追加
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user 
end
