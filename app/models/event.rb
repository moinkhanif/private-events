class Event < ApplicationRecord
  validates_presence_of :name, :body, :date, :user_id

  belongs_to :user

  has_many :invites
  has_many :attendees, through: :invites, source: :user

  scope :upcoming_date, -> { select { |event| event.date >= Time.zone.now } }
  scope :past_date, -> { select { |event| event.date < Time.zone.now } }

  def self.creator(event)
    User.where(id: event.user_id).first
  end
end
