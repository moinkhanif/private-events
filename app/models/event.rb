class Event < ApplicationRecord
  has_many :creators
  has_many :users, through: :creators
end
