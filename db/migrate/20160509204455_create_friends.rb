class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.string :name
      t.string :contact
      t.integer :catchup_period

      t.timestamps null: false
    end
  end
end
