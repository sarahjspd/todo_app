class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|

    	t.string :taskname
    	t.text :description
    	t.datetime :duedate
    	t.string :priority

    	t.timestamps
    end
  end
end
