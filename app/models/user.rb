class User < ApplicationRecord
  include Clearance::User

  has_many :events, dependent: :destroy
  has_many :attendances, dependent: :destroy
  has_many :ratings, dependent: :destroy

  before_save :check_level

  def check_level
	if self.point >= 7000
		self.level = "Platinum"
	elsif self.point >= 4000
		self.level = "Gold"
	elsif self.point >= 1500
		self.level = "Silver"
  	elsif self.point >= 500
		self.level = "Bronze"
	else
		self.level = "Plastic"
	end
  end
  
end
