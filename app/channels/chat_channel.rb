class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from channel_name
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def post_message(payload)
    group = current_user.groups.find_by! id: params[:group_id]
    message = group.messages.new user: current_user, body: payload['body']
    if message.save
      message_json = message.as_chat_format
      ActionCable.server.broadcast channel_name, message: message_json
    end
  end

  private

  def channel_name
    "chat_#{params[:group_id]}"
  end
end
