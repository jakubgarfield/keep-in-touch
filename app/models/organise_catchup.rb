class OrganiseCatchup
  def initialize(friend)
    @friend = friend
  end

  def call
    @friend.catchups.build(scheduled: Date.today + @friend.catchup_period.days)
    @friend.save
  end
end
