class Blog < ApplicationRecord
    belongs_to :user, optional: true
    has_many :goods, dependent: :destroy
    has_many :gooded_users, through: :goods, source: :user
end
