class Event < ApplicationRecord
  has_many :creators
  has_many :users, through: :creators
  validates_presence_of :name,:body,:date
end
