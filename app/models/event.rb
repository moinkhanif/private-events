class Event < ApplicationRecord
  has_many :invites
  has_many :guests, through: :invite, source: :user
  validates_presence_of :name, :body, :date
end
