class FinaliseCatchup
  def initialize(catchup)
    @catchup = catchup
  end

  def call
    @catchup.update_attributes!(status: Catchup::DONE)
    OrganiseCatchup.new(@catchup.friend).call
  end
end
