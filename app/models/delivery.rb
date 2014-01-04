class Delivery < ActiveRecord::Base
  attr_accessible :date, :jewel_id
  validates_presence_of :date, :jewel_id

  belongs_to :jewel
end
