class Event < ApplicationRecord
  validates :name, :start_date, :end_date, presence: true
end
