class Like < ApplicationRecord
  belongs_to :motivation
  belongs_to :user
  belongs_to :blog
  validates_uniqueness_of :motivation_id, scope: :user_id
  validates_uniqueness_of :blog_id, scope: :user_id
end
