class Event < ApplicationRecord
	has_many :attendances, dependent: :destroy
	has_many :ratings, dependent: :destroy
	belongs_to :user

	def average_rating
		sum = 0
		if ratings.count != 0
			ratings.each do |r|
				sum += r.star.to_i
			end
			sum / ratings.count
		else
			sum
		end
	end

	def self.sorted_by_average_rating
		list = self.all.sort_by(&:average_rating).reverse
		list[0..4]
	end
end	