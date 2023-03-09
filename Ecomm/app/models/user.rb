class User < ApplicationRecord
    has_many :followers
    has_many :followings
    has_many :posts
    has_many :comments, through: :post
end
