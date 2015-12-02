class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.date :appointmentdate
      t.time :startTime
      t.string :comment
      t.integer :patient_id
      t.integer :doctor_id

      t.timestamps null: false
    end
  end
end
