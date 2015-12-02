class Appointment < ActiveRecord::Base
 # attr_accessible :patient_id, :doctor_id
  belongs_to :patient
  belongs_to :doctor
  
  
 
  
end
