class PostponeCatchup
  def initialize(catchup)
    @catchup = catchup
  end

  def call
    next_scheduled = @catchup.scheduled + 1.day
    @catchup.update_attributes(status: Catchup::POSTPONED, scheduled: next_scheduled)
  end
end
