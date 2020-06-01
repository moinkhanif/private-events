class User < ApplicationRecord
  validates_presence_of :name

  has_many :events

  has_many :invites
  has_many :attended_events, through: :invites, source: :event
end
