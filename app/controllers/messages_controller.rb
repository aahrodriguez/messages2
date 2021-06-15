class MessagesController < ApplicationController
before_action :require_user

  def create
    message = current_user.messages.build(messages_param)
    if message.save
      ActionCable.server.broadcast "chatroom_channel", mod_message: message_render(message)
    end
  end

  private

  def messages_param
    params.require(:message).permit(:body)
  end
  
  def message_render(message)
    render(partial: 'message', locals: {message: message})
  end
end
