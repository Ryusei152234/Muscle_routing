class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :motivations,dependent: :destroy
         has_many :blogs,dependent: :destroy
         has_many :likes, dependent: :destroy
         has_many :liked_motivations, through: :likes, source: :motivation
         def already_liked?(motivation)
          self.likes.exists?(motivation_id: motivation.id)
        end
        has_many :liked_blogs, through: :likes, source: :blog
         def already_gooded?(blog)
          self.goods.exists?(blog_id: blog.id)
        end
        has_many :comments, dependent: :destroy
        has_many :goods, dependent: :destroy
        has_many :gooded_blogs, through: :goods, source: :blog
end
