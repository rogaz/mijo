class User < ApplicationRecord
  validates :email, presence: true

  has_and_belongs_to_many :events
end
