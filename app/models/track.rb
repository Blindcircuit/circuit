class Track < ActiveRecord::Base
  belongs_to :user
  has_many :records
end
