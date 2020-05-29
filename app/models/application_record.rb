class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  scope :upcoming_date, -> { select { |event| event.date >= Time.now } }
  scope :past_date, -> { select { |event| event.date < Time.now } }
end
