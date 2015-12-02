class Appointment < ActiveRecord::Base
 # attr_accessible :patient_id, :doctor_id
  belongs_to :patient
  belongs_to :doctor
  
  def isAvailable
   if(appointment.where(doctor_id: self.doctor_id,startTime: self.startTime,appointmentdate: self.appointmentdate).take) 
    error.add(:startTime, "and Duration clash with another appointment for this Healthcare Doctor.")
    puts "********IsAvailable Method *****"
   end
  end
  
 
  
end
