class FinaliseCatchup
  def initialize(catchup)
    @catchup = catchup
  end

  def call
    return false if @catchup.in_final_state?

    @catchup.update_attributes!(status: Catchup::DONE)
    OrganiseCatchup.new(@catchup.friend).call
  end
end
