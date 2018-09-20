class DestinationType < ActiveRecord::Base
  has_many :appointments, :class_name => 'Appointment'
  has_many :destinations, through: :appointments
end
