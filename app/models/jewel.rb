class Jewel < ActiveRecord::Base
  attr_accessible :source, :citation, :quote, :comment

  validates_presence_of :source, :citation, :quote, :comment
end
