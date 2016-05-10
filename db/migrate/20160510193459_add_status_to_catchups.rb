class AddStatusToCatchups < ActiveRecord::Migration
  def change
    add_column :catchups, :status, :string
  end
end
