class FriendsController < ApplicationController
  before_action :set_friend, only: [:show, :edit, :update, :destroy]

  def index
    @friends = current_user.friends.all
  end

  def show
  end

  def new
    @friend = current_user.friends.new
  end

  def edit
  end

  def create
    @friend = current_user.friends.build(friend_params)

    respond_to do |format|
      if @friend.valid? && OrganiseCatchup.new(@friend).call
        format.html { redirect_to @friend, notice: 'Friend was successfully created.' }
        format.json { render :show, status: :created, location: @friend }
      else
        format.html { render :new }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @friend.update(friend_params)
        format.html { redirect_to @friend, notice: 'Friend was successfully updated.' }
        format.json { render :show, status: :ok, location: @friend }
      else
        format.html { render :edit }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @friend.destroy
    respond_to do |format|
      format.html { redirect_to friends_url, notice: 'Friend was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_friend
    @friend = current_user.friends.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    flash[:error] = "This is not your friend."
    redirect_to friends_path
  end

  def friend_params
    params.require(:friend).permit(:name, :contact, :catchup_period)
  end
end
