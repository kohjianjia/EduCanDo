class Event < ApplicationRecord
	has_many :attendances
	belongs_to :user
end	