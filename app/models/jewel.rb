class Jewel < ActiveRecord::Base
  validates_presence_of :source, :citation, :quote, :comment
end
