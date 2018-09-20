class Place < ActiveRecord::Base
  belongs_to :destination
  has_many :photos, dependent: :destroy
end
