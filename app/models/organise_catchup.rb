class OrganiseCatchup
  def initialize(friend)
    @friend = friend
  end

  def call
    date_offset = @friend.next_catchup ? @friend.next_catchup.scheduled : Date.today
    @friend.catchups.build(scheduled: date_offset + @friend.catchup_period.days)
    @friend.save
  end
end
