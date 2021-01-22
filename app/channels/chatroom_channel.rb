class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "cahtroom_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
