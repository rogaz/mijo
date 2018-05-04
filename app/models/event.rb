class Event < ApplicationRecord
  validates :name, :start_date, :end_date, :description, presence: true
end
