class SkipCatchup
  def initialize(catchup)
    @catchup = catchup
  end

  def call
    @catchup.update_attributes!(status: Catchup::SKIPPED)
    OrganiseCatchup.new(@catchup.friend).call
  end
end
