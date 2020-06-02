class Invite < ApplicationRecord
  validates_presence_of :name

  belongs_to :user
  belongs_to :event
end
