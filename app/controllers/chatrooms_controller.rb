class ChatroomsController < ApplicationController
  before_action :require_user
  def index
    @message = Message.custom_display
    @messages = Message.all
  end
end
