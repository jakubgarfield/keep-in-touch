class PostponeCatchup
  def initialize(catchup)
    @catchup = catchup
  end

  def call
    return false if @catchup.in_final_state?

    next_scheduled = @catchup.scheduled + 1.day
    @catchup.update_attributes(status: Catchup::POSTPONED, scheduled: next_scheduled)
  end
end
