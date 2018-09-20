class Appointment < ActiveRecord::Base
  belongs_to :destination
  belongs_to :destination_type
end
