class Patient < ActiveRecord::Base
  #attr_accessible :name
  has_many :appointments
  has_many :doctors, through: :appointments
end