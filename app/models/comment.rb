class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :pop
  has_many :notifications, dependent: :destroy
end
