class CreateTasklists < ActiveRecord::Migration[5.1]
  def change
    create_table :tasklists do |t|

    	t.string :tasklistname

    	t.timestamps

    	#don't need to have t.integer :id because Rails will automatically create it.

    end
  end
end
