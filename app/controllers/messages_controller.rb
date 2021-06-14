class MessagesController < ApplicationController
before_action :require_user

  def create
    message = current_user.messages.build(messages_param)
    if message.save
      redirect_to root_path
    end
  end

  private

  def messages_param
    params.require(:message).permit(:body)
  end
end
