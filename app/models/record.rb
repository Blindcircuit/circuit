class Record < ActiveRecord::Base
  belongs_to :user
  belongs_to :car
  belongs_to :track

end
