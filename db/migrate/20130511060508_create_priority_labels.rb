class CreatePriorityLabels < ActiveRecord::Migration
  def change
    create_table :priority_labels do |t|
      t.string :color
      t.string :title

      t.timestamps
    end
  end
end
