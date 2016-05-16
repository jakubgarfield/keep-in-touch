class AddLastEmailSentAtToCatchups < ActiveRecord::Migration
  def change
    add_column :catchups, :last_email_sent_at, :datetime
  end
end
