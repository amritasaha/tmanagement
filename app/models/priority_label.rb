class PriorityLabel < ActiveRecord::Base
  attr_accessible :color, :title
  has_many :tasks
end
