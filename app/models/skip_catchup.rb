class SkipCatchup
  def initialize(catchup)
    @catchup = catchup
  end

  def call
    return false if @catchup.in_final_state?

    @catchup.update_attributes!(status: Catchup::SKIPPED)
    OrganiseCatchup.new(@catchup.friend).call
  end
end
