class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
    	t.string :name
    	t.datetime :deleted_at
 
    	t.timestamps

    	t.index :deleted_at
    end
  end
end