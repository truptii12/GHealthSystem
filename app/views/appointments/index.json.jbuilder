json.array!(@appointments) do |appointment|
  json.extract! appointment, :id, :appointmentdate, :starTime, :endTime, :comment, :patient_id, :doctor_id
  json.url appointment_url(appointment, format: :json)
end
