class Record < ActiveRecord::Base
  has_many :users
  belongs_to :car
  belongs_to :track

end
