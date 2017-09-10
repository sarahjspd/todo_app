class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|

    	t.string :taskname
    	t.text :description
    	t.date :duedate
    	t.string :priority
    	t.string :status

    	t.timestamps

    	t.references :tasklist, foreign_key: true
    end
  end
end
