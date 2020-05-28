class User < ApplicationRecord
  has_many :creators
  has_many :events, through: :creators
end
