class Event < ApplicationRecord
	has_many :attendances, dependent: :destroy
	has_many :ratings, dependent: :destroy
	belongs_to :user
end	