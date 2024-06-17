class Like < ApplicationRecord
  belongs_to :motivation
  belongs_to :user
  validates_uniqueness_of :motivation_id, scope: :user_id
end
