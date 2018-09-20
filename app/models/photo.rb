class Photo < ActiveRecord::Base
  belongs_to :destination
  belongs_to :place
end
