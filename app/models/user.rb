class User < ApplicationRecord
  include Clearance::User

  has_many :events
  has_many :attendances
  
end
