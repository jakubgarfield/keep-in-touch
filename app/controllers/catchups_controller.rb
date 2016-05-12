class CatchupsController < ApplicationController
  before_filter :set_catchup

  def show
  end

  def postpone
    if PostponeCatchup.new(@catchup).call
      flash[:success] = "The catchup was postponed."
    else
      flash[:error] = "Something went wrong."
    end

    redirect_to @catchup
  end

  def skip
    if SkipCatchup.new(@catchup).call
      flash[:success] = "The catchup was skipped."
    else
      flash[:error] = "Something went wrong."
    end

    redirect_to @catchup
  end

  def finalise
    if FinaliseCatchup.new(@catchup).call
      flash[:success] = "The catchup was finalised."
    else
      flash[:error] = "Something went wrong."
    end

    redirect_to @catchup
  end

  private
  def set_catchup
    @catchup = current_user.catchups.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    flash[:error] = "This is not your catchup."
    redirect_to friends_path
  end
end
