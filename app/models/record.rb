class Record < ActiveRecord::Base
  has_many :user
  has_many :car
end
