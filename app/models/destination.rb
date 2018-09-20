class Destination < ActiveRecord::Base
  has_many :appointments, :class_name => 'Appointment'
  has_many :destination_types, through: :appointments
  has_many :places, dependent: :destroy
  has_many :photos, dependent: :destroy
end
