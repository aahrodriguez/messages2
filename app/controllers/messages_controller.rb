class MessagesController < ApplicationController
before_action :require_user

  def create
    message = current_user.messages.build(messages_param)
    if message.save
      puts "parte 1"
      ActionCable.server.broadcast "chatroom_channel", foo: message_render( message.body || "Default Message" )
    else
      puts "parte 2"
      render :json {message: "error"}, status: 202
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
