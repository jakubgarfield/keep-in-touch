class NotifyCatchups
  def self.run
    puts "#{Time.zone.now} - Starting to send notifications for catchups."
    catchups = Catchup.for_email.preload(:friend)
    catchups.for_email.each do |catchup|
      CatchupMailer.notify(catchup).deliver
      catchup.update_attributes!(last_email_sent_at: Time.now)
    end
    puts "#{Time.zone.now} - All #{catchups.count} notifications sent successfully."
  end
end
