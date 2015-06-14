class Task < ActiveRecord::Base
  attr_accessible :description, :list_id, :position, :priority_label_id, :title
  belongs_to :list, :class_name => 'List', :foreign_key => 'list_id'
  belongs_to :priority_label, :class_name => 'PriorityLabel', :foreign_key => 'priority_label_id'
end
