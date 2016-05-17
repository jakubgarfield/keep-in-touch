class CatchupMailer < ApplicationMailer
  def notify(catchup)
    @catchup = catchup
    @friend = catchup.friend
    @user = catchup.user
    headers['X-MC-PreserveRecipients'] = false
    mail to: @user.email,
         subject: "You should catchup with #{@friend.name}"
  end
end
