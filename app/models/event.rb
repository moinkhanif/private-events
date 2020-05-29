class Event < ApplicationRecord
  validates_presence_of :name, :body, :date, :user_id

  belongs_to :user

  has_many :invites
  has_many :guests, through: :invites, source: :user
end
