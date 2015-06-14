class List < ActiveRecord::Base
  attr_accessible :board_id, :position, :title
  has_many :tasks
  belongs_to :board, :class_name => 'Board', :foreign_key => 'board_id'
end
