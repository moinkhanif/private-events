class User < ApplicationRecord
  has_many :events

  has_many :invites
  has_many :invitations, through: :invites, source: :event
end
