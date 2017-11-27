class CreateContactPhoneNumbers < ActiveRecord::Migration[5.1]
  def change
    create_table :contact_phone_numbers do |t|
    	t.references :contact, index: true, foreign_key: true
    	t.string :phone_type
    	t.string :number
    	t.datetime :deleted_at

    	t.index :deleted_at
    end
  end
end
