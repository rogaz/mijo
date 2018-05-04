class Event < ApplicationRecord
  validates :name, :start_date, :end_date, :description, presence: true

  has_and_belongs_to_many :users

end
