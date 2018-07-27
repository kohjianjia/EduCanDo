class Event < ApplicationRecord
	has_many :attendances
	has_many :ratings
	belongs_to :user
end	