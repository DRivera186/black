class Idea < ActiveRecord::Base
  belongs_to :user
  has_many :users_liked, through: :likes, source: :user
  has_many :likes, dependent: :destroy
end
