class CreateCatchups < ActiveRecord::Migration
  def change
    create_table :catchups do |t|
      t.date :scheduled, null: false
      t.belongs_to :friend, null: false
    end
  end
end
