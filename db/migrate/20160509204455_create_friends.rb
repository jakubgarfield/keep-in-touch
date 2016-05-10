class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.string :name, null: false
      t.string :contact, null: false
      t.integer :catchup_period, null: false
      t.belongs_to :user, null: false

      t.timestamps null: false
    end
  end
end
