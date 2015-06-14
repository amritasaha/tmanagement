class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.integer :position
      t.integer :priority_label_id
      t.integer :list_id

      t.timestamps
    end
  end
end
